Received: from mail-qw0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1S0hD4-0005ua-Gf
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 23:32:22 +0100
Received: by qaea17 with SMTP id a17so2076061qae.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 14:24:00 -0800 (PST)
Received-SPF: pass (google.com: domain of kergoth@gmail.com designates
	10.229.135.85 as permitted sender) client-ip=10.229.135.85; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of kergoth@gmail.com
	designates 10.229.135.85 as permitted sender)
	smtp.mail=kergoth@gmail.com;
	dkim=pass header.i=kergoth@gmail.com
Received: from mr.google.com ([10.229.135.85])
	by 10.229.135.85 with SMTP id m21mr2453432qct.26.1330035840279
	(num_hops = 1); Thu, 23 Feb 2012 14:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=ap+bat7M7OJxLTmxQa/uF79XZs9Ize9LP3LXsI/69WM=;
	b=nn9Z5/L65dti6gZZuasnbsdUVhw0/tpbSSDMhsI61a86/59Q1JORwE+DZ4n+Z2nhyj
	xn0w8KtHpQf2uFC8p6KB1r2g4AI3/x2IO4VvLLtuKGLBLqi+01gUlCPh/5LzQbwiowdM
	8ugQWagEM21t2xN/kKELuGDEy5XubE1MLUmE8=
Received: by 10.229.135.85 with SMTP id m21mr2096823qct.26.1330035840177; Thu,
	23 Feb 2012 14:24:00 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.224.145 with HTTP; Thu, 23 Feb 2012 14:23:40 -0800 (PST)
In-Reply-To: <20120223210101.GB3769@jama.jama.net>
References: <4F4645CC.4050403@opendreambox.org>
	<20120223140409.GT3769@jama.jama.net>
	<4F466F3D.8060504@opendreambox.org>
	<20120223210101.GB3769@jama.jama.net>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 23 Feb 2012 15:23:40 -0700
X-Google-Sender-Auth: PVxx1lvHiBr09xgu8bXcvnNcUUA
Message-ID: <CABcZANnRqSWTnYWgASuCs_pmy6GoE4EsuTr3edLKkHhW97fh1Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: bug in recipe version priorities across layers?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Feb 2012 22:32:22 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 23, 2012 at 2:01 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> Would lowering the priority of meta-openembedded affect its ability to
>> bbappend OE-core's recipes? Is it possible to lower its priority, or to
>> raise the priority of OE core, without modifying conf/layer.conf in
>> either layer?
>
> I don't remember exact rules now, but priority is strange combination of
> layer.conf priority and order of bblayers.conf which doesn't even behave
> the same for .bbclasses and .bb files IIRC, there was discussion about
> improving this situation but I haven't seen any patches doing it since
> then. FWIW .bbappend files work as expected in any layer.

BBFILE_PRIORITY controls recipe priority. BBLAYERS order controls
BBPATH order which in turn controls bbclass/config priority, as things
stand today.
-- 
Christopher Larson


