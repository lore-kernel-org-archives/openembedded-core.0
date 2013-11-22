Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by mail.openembedded.org (Postfix) with ESMTP id B0AA56AE9E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 18:49:06 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id o6so1812144oag.32
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 10:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=w1uqVBY3/+fBT4O8hks3iUyDvjWhiNdP6exGHnQsn5M=;
	b=eOE40UNAyDkzJuUVHjI7CROjOZKf5xviRYIdPEn4WWzJoynfYhYLr1XNGVzzAMiP8k
	3chfe/tOG891fWyRo80XCughOUsUtFvXgC9ewx/xpVmCFT/5FihBBOCXfTFPh61+sMzs
	pOBfpJ9iXJVpvxp3Vj9DPbbsihg04OLMGShvvlsi6d5fu3GsKv8BsgWBOx4V2J8VxbCx
	tCbTbERKLdXJf8wJ6VKFEFF7vgCzirNjB/Rmuikqp0JFu6QqvjniEHgpLWQh7k7xX/EK
	Iml2z96IWTTVndhg2wjwF+3F8+n1rNAg+Ze5uga1eUmrNlbxU8v3/ZoWCfShEzrq7527
	AXsQ==
MIME-Version: 1.0
X-Received: by 10.60.117.225 with SMTP id kh1mr11752295oeb.15.1385146145857;
	Fri, 22 Nov 2013 10:49:05 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Fri, 22 Nov 2013 10:49:05 -0800 (PST)
In-Reply-To: <1385132854.16887.178.camel@ted>
References: <1385132854.16887.178.camel@ted>
Date: Fri, 22 Nov 2013 16:49:05 -0200
X-Google-Sender-Auth: _WH3MYgPsRffwGtvw2bHZaldFVk
Message-ID: <CAP9ODKrX9s6S8Cw+m-NiuctPZ4nT7wjkd7CfwuCUjO5Vc5zwXw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] metadata_scm: Avoid crashing on new svn version layouts
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
X-List-Received-Date: Fri, 22 Nov 2013 18:49:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 22, 2013 at 1:07 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> This avoids crashing on newer svn layouts where the entries files
> don't contain three lines. If someone wants to fix this to
> get the right version on newer subversion checkouts, patches
> welcome but this at least stops things crashing.
>
> [YOCTO #5363]
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Does not seem right to 'workaround' this; it'd be better to fix it properly.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

