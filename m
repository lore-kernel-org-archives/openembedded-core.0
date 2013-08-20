Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 031936B8BB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 12:02:41 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id dn14so418958obc.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 05:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=BZ52N1H5u5eVSYP/DAn2NhB+Zb9wGkC6fuc7331IQFg=;
	b=sSHLVZmDX0Mf8h4HGusfV2f4MNk3N3D583CG0I8LNMeiNJXLu5V2guQmKykchmAcLG
	cOFwVnY5AhSJDjWirr6cm2HdJo5nrrvW+CEOBiin1VVaUlYOavo8DKd3PyfotX99/EX8
	U9TebG+c51sldP2g0Zy50LK0SbGZjWiaGzQwKlx1EFvKDEe50//iEoWi2TNJplvStN5k
	1k35a/Zmx+x4SawSaWSdURktRFgOucorTXhJ6BeXIbxE9Q+RherskH3GnH2jnoGrK7ZE
	QBdVBhyjpjGIP2vdcjOvShdE5DTu6Oaj2CGZoPp6/x9i3YQmkuZSNH9KTpMKrubbfenG
	BCmA==
MIME-Version: 1.0
X-Received: by 10.60.134.14 with SMTP id pg14mr1082477oeb.66.1377000162442;
	Tue, 20 Aug 2013 05:02:42 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Tue, 20 Aug 2013 05:02:42 -0700 (PDT)
In-Reply-To: <52133D29.4010104@topic.nl>
References: <1376401955-5676-1-git-send-email-otavio@ossystems.com.br>
	<52133D29.4010104@topic.nl>
Date: Tue, 20 Aug 2013 09:02:42 -0300
X-Google-Sender-Auth: KGkHqw_d8xTCqDca5jtSQfNERQc
Message-ID: <CAP9ODKrPRJ27BEd_opFrNyVt33dm5SQ96UoVGraYmSninH=9cA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Evan Kotara <evan.kotara@freescale.com>,
	Daiane Angolini <daiane.angolini@freescale.com>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] linux-dtb: Use kernel build system to generate the dtb files
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
X-List-Received-Date: Tue, 20 Aug 2013 12:02:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Aug 20, 2013 at 6:55 AM, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> I cannot get this to work, do_install fails because it cannot find the
> generated ".dtb" file.

Yes and I sent another patch, few days ago, to address this
regression. I think it is queued for merging.

http://patchwork.openembedded.org/patch/55951/

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

