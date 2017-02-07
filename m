Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EC2AC605C2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Feb 2017 12:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v17CkAoI008841; Tue, 7 Feb 2017 12:46:10 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id OifycqgdkbYj; Tue,  7 Feb 2017 12:46:10 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v17Ck8HE008835
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 7 Feb 2017 12:46:10 GMT
Message-ID: <1486471568.24931.0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Date: Tue, 07 Feb 2017 12:46:08 +0000
In-Reply-To: <alpine.LFD.2.20.1702070704440.10245@uk63952.mitel.com>
References: <alpine.LFD.2.20.1702070704440.10245@uk63952.mitel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: how many ways can a recipe place content in its own ${STAGING_BINDIR_CROSS}?
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
X-List-Received-Date: Tue, 07 Feb 2017 12:46:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-02-07 at 07:21 -0500, Robert P. J. Day wrote:
> ok, that's easy enough, but let's look at "apr" now. if i look at
> what
> apr installs under its sysroot and specifically under the same
> usr/bin
> directory, i see:
> 
> $ tree usr/bin
> usr/bin
> └── crossscripts
>     └── apr-1-config
> 
>   so how did *that* script come to be under there? if i look at the
> apr_1.5.2.bb recipe, there's no manual installation of that script as
> there was with apache2. rather, there's all this:

Look at binconfig.bbclass which I'd bet apr inherits (although I didn't
actually look).

Cheers,

Richard

