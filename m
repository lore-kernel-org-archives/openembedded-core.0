Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f51.google.com (mail-pb0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4ED326007B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Oct 2013 17:07:09 +0000 (UTC)
Received: by mail-pb0-f51.google.com with SMTP id jt11so7434619pbb.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Oct 2013 10:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=tUrT8qZPPWAkOEAhUwBQmfHIlh1pcehlQnQtblI/SYE=;
	b=0cwwWQ11tpCitImsxEbbukQxIMjANfb4nDCYLF9IVJuFi05kI6EtsBhsmEBCe5gaeV
	UVgsjUItHa90cPxlbX+oHZG2IYr2CElqJdrHj8n/EvFGhccl+gEiFAS9PPd5ww5iZsS0
	Qz48if5lLFmr2afrR/t+kSCKNbWYw8987QUs8qpN+cafKgO4yyPB495W9vcP3VYeXYdv
	LGd2H6fJ0hDyg73tNxZikrdsj6DTJI66i7Yn3X1DCwCBCMiwGQ6/zZRJ2eVshbJeZ3+o
	xV6Ke0o7iJx8M4Cj3uc46DP3gD+g+koe6vzjpmbjlO9/tt3s5A2KiTWh78j+MMNr6Y/k
	+I4A==
X-Received: by 10.66.159.40 with SMTP id wz8mr15153408pab.135.1380647231134;
	Tue, 01 Oct 2013 10:07:11 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id
	vz4sm9458806pab.11.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 01 Oct 2013 10:07:10 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1380646575.23533.89.camel@phil-desktop.brightsign>
Date: Tue, 1 Oct 2013 10:07:09 -0700
Message-Id: <AAB26854-909B-4667-B173-E02F3595A0FA@gmail.com>
References: <1380646260-15245-1-git-send-email-sgw@linux.intel.com>
	<1380646575.23533.89.camel@phil-desktop.brightsign>
To: Phil Blundell <pb@pbcl.net>
X-Mailer: Apple Mail (2.1510)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] makedevs: Do not return error if the fifo exisits
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Oct 2013 17:07:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


On Oct 1, 2013, at 9:56 AM, Phil Blundell <pb@pbcl.net> wrote:

> On Tue, 2013-10-01 at 09:51 -0700, Saul Wold wrote:
>> static void add_new_fifo(char *name, char *path, unsigned long uid,
>> 				  unsigned long gid, unsigned long mode)
>> {
>> -	if (mknod(path, mode, 0))
>> +	if (mknod(path, mode, 0) && errno != EEXIST)
>> 		error_msg_and_die("%s: file can not be created with mknod!", path);
> 
> Will this do the right thing if the mode has changed from the old to the
> new versions?

and it wont catch dangling symlinks anymore

> 
> p.
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


