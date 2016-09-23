Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 281376E650
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 14:56:57 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id e66so31045124iod.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 07:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=MGPtsvUuL89DQ/O9gLaq0iSq9fa2b4ZZ8kjUrJ+cL7E=;
	b=e3MNFSeG1JyzB9emRMMgXxGoS97PdI1zCJ/RCO6IZLZxSz1j5CetD/FuSZ997CZXoJ
	T4rU1/MGeSMi8PwB884jytY1w9gdyFHJh+lEIUAtFwuoQMrNybuW4mELtL3tqr96mwVM
	78TK1suHp+uL2czHRUkrumiAIYeEm3Om2Oz26QwpCrwHsl0rRHSsiOQISvD6EhUn5gEI
	5QFFWjqOgq1M5jFEBxs4FdbmQp/XrJX34HYyTB58ejFKZ/8m+nVso1aOs9v36Oeyg+XZ
	7xSpFvZVym/K6oBp4UgUOk3HUthxL7pXMkK9h6jJvF4y8t8kcW3w6CY8WlL6aDOtDTc5
	oJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=MGPtsvUuL89DQ/O9gLaq0iSq9fa2b4ZZ8kjUrJ+cL7E=;
	b=RVsb5n3FJo0C3oKG/0gvSqAsvpGX7JXkJ1+DQ63SVR/QFV8uQxtTe3NtcH596jbiX9
	nS6hXyrgfLdFHv2nnSMuf4o51m9d2x0LAafGwymvdQt7QegvwphmyBPWYc6SfFFQTaOU
	gMS37OGh30WtVn+C0l/VrpocdWcY5EZiXJzk1TC4k2dJUWUaIL2qJeIs/XAVqAaAX/vh
	5mG/nDRPuW7F2YqIc9+HjI/D4MXo9xYgIlgZaQiyoyKLxvoZHaUPZsinYj3lZTvysCAs
	0wMvDYGx3jf9DYe5W74mKy7t1a0jf7EGZrlfstX+Jo1QtTClRcho0WNoR+nEnej+feUw
	c7UA==
X-Gm-Message-State: AE9vXwNTll8noL7jtF3kSsx6H5vDBmwr1VRJxF2SGDKGGYfFMhh8ZeCHjStnTcIJiNntEgCP
X-Received: by 10.107.29.135 with SMTP id d129mr9313055iod.150.1474642619499; 
	Fri, 23 Sep 2016 07:56:59 -0700 (PDT)
Received: from pohly-mobl1 (p57A56298.dip0.t-ipconnect.de. [87.165.98.152])
	by smtp.gmail.com with ESMTPSA id
	j194sm2944568ioe.39.2016.09.23.07.56.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Sep 2016 07:56:58 -0700 (PDT)
Message-ID: <1474642615.8561.10.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Richard Purdie <rpurdie@rpsys.net>
Date: Fri, 23 Sep 2016 16:56:55 +0200
In-Reply-To: <1474642090.30475.0.camel@rpsys.net>
References: <cover.1474444335.git.mariano.lopez@linux.intel.com>
	<facdb05bcfaa9eab9eed0b7db17fad854f6ec046.1474444335.git.mariano.lopez@linux.intel.com>
	<CABcZAN=K8oZwJds4AnjMcvLoq3PtrS+Be8hu=GQYKQUy-s=65A@mail.gmail.com>
	<1474642090.30475.0.camel@rpsys.net>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Christopher Larson <clarson@kergoth.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] toolchain-shar-relocate.sh: Add error-handling
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
X-List-Received-Date: Fri, 23 Sep 2016 14:56:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-09-23 at 15:48 +0100, Richard Purdie wrote:
> On Wed, 2016-09-21 at 19:06 -0700, Christopher Larson wrote:
> > 
> > On Wed, Sep 21, 2016 at 12:54 AM, <mariano.lopez@linux.intel.com>
> > wrote:
> > > diff --git a/meta/files/toolchain-shar-relocate.sh
> > > b/meta/files/toolchain-shar-relocate.sh
> > > index d4bcf0e..e491153 100644
> > > --- a/meta/files/toolchain-shar-relocate.sh
> > > +++ b/meta/files/toolchain-shar-relocate.sh
> > > @@ -1,3 +1,8 @@
> > > +if ! xargs --version > /dev/null 2>&1; then
> > > +       echo "xargs is required by the relocation script, please
> > > install it firts. Abort!"
> > > +       exit 1
> > > +fi
> > > 
> > This is pointless, xargs is mandated by posix/sus.
> 
> It appears we have some users with stripped down containers where it
> hasn't been installed though and having a user readable message is
> better

... and even better is one without typos ;-}

s/firts/first/

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




