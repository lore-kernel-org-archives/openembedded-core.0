Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f171.google.com (unknown [209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5055A601A0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 May 2014 06:33:29 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id c1so1983771igq.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 May 2014 23:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=J3nvhxKK0V2hGt0cHmgxoFEG6mB5ptSZWmALgzkwWx0=;
	b=zylDBtmGVKbP3cNr24qeZ5oq+pd+a8zLmDDqMMsUaabXF7XJq49OGz7oPmRrWLH7OL
	4j11rLHfqr4rwiDaWEUNZ93YeeUbRpzuKChfgswKqqn6t9corbnpMYj/fNIiRCw3DVKB
	opPDuZflc5OuJXGOxlWsnMjFXtqf/UMaF2rH66Mbw8Ha9xInfulIwARAjVhbyNYxD8kB
	k8v5gTxqQPpFX7HeRCeWQFL26VypB6KZ3cm4bxP1YAV0VktM9GvbCgGggbSV4/OeDg/s
	TYWR1pXf//6p0GqGWF2O1UfS/HNm+eI/u88cNhiNgZCY5SJFEJWrurgQHM5cuKczpUSk
	i9NQ==
X-Received: by 10.50.43.136 with SMTP id w8mr17930606igl.20.1399703611173;
	Fri, 09 May 2014 23:33:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.79.133 with HTTP; Fri, 9 May 2014 23:33:01 -0700 (PDT)
In-Reply-To: <1399580261-16249-1-git-send-email-drew@moseleynet.net>
References: <1399580261-16249-1-git-send-email-drew@moseleynet.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 May 2014 23:33:01 -0700
Message-ID: <CAMKF1srGS73dbGsRC3hw6Aewn7aHp0JokEFisy=vRy4WBmmSCQ@mail.gmail.com>
To: Drew Moseley <drew@moseleynet.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa-demos: Specify the lib dir to locate glut libraries
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
X-List-Received-Date: Sat, 10 May 2014 06:33:37 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 8, 2014 at 1:17 PM, Drew Moseley <drew@moseleynet.net> wrote:
> +PACKAGECONFIG[glut] = "--with-glut=${STAGING_LIBDIR},--without-glut,"

should this be libdir instead ?

