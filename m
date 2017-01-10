Return-Path: <ola.redell@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 77EBF6003C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 08:44:08 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id q89so7897699lfi.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 00:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=YIiVMokNznp2E25ar2mygDCIUrZHXDNNdAEpQ4nWIvA=;
	b=GpkPr7hRCk+jrvCoPkGOeJAcjA+cZab5E8TxBrT4TtfZkpLG2lDu5SroApfilwvfGm
	tkvKR1E6cy93ZJ2iwsL7ddBPZPqOnhpvluGpgSTxcumucQYCqzbzhXfbM+P+0fHyrP2n
	dkKs9W534JhIrGtze2AN8G6RazNVCI/c4yKmDUhZwjrr0q4HIPdL1NxSSO2zybUjyW/J
	ltscFYu27Gj4kDwFFwaqNvd4BQ5V6gqlLHPT+M1TqKeQlD8YSSb9qCQqkQDMt1XPp/h8
	p4mOPic2fT5ww4WBbu8EEOfIoqVBxH//GTtKsy9igiE5vcNnBhj+gyz3NwWF5d/0ZLWu
	wb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=YIiVMokNznp2E25ar2mygDCIUrZHXDNNdAEpQ4nWIvA=;
	b=Y5mEKfkEHbCUKnDlTp30ivsD+muqpRwRlUPIhRq7bOldLkFmSX8TRYYqLVn+PdzGL2
	kCbx8vr7kTOon8xsANaIiOHJES9xgYT+kdEZboM6kuQIsIg3IkirMHfYsf7q9bFaixuo
	Gdmij7VPdCTr67jetvgRKrq4J9D0Er8fuw1z7opDNi/1Vco6XXsEYu1ecWOLNmnFuP6H
	hGyOX7x5QTZ4KHgN09J/Zrj3WSKZ+MwextM2PWdi7lmCmiEmRHnPWQESRjUjDsuaKrlD
	GsqlKnfs1dsrWtGz8KkalQ4aJ9TfZhPltucqnkoDB/kdOUQUAjAR/X4KQsyfKNFtChpQ
	RlaA==
X-Gm-Message-State: AIkVDXLOeCCt9zqhgx06i2qRPhXj3Sys6+RKQonSoZQSYuzBJeP0b0bLay3VC9+zXGrq7Q==
X-Received: by 10.25.79.30 with SMTP id d30mr718034lfb.38.1484037848181;
	Tue, 10 Jan 2017 00:44:08 -0800 (PST)
Received: from [192.168.1.122] (81-230-13-64-no94.tbcn.telia.com.
	[81.230.13.64]) by smtp.googlemail.com with ESMTPSA id
	c78sm284069lfc.39.2017.01.10.00.44.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Jan 2017 00:44:07 -0800 (PST)
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1483955680-18110-1-git-send-email-ola.redell@retotech.se>
	<CADkTA4PFOUmv3W8stkhDmewwDfBE+efZEVym903937jz6eAo7g@mail.gmail.com>
From: Ola Redell <ola.redell@gmail.com>
Message-ID: <314ad0bd-0cab-723a-520b-2db8b6e3b9f7@gmail.com>
Date: Tue, 10 Jan 2017 09:44:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4PFOUmv3W8stkhDmewwDfBE+efZEVym903937jz6eAo7g@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] kernel-module-split: Append KERNEL_VERSION string to kernel module name
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
X-List-Received-Date: Tue, 10 Jan 2017 08:44:09 -0000
Content-Type: multipart/alternative;
	boundary="------------4856298D7F8F3C6FDD85C378"

--------------4856298D7F8F3C6FDD85C378
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01/09/2017 06:20 PM, Bruce Ashfield wrote:
>
> The functionality you describe is a good thing, but I have a few 
> questions to make
> sure I understand the change, and confirm that existing functionality 
> isn't broken ..
> and that the internals of the package management do the right thing 
> (I'm not an
> expert on those internals .. so bear with me).
I am not an expert either so I thought I'd suggest this since it works 
for me and see how it is received.
>
> With this change, do you know if RDEPENDS="kernel-module-foo" still 
> works ? or
> does it now have to be RDEPENDS="kernel-module-foo-<version>" ?
>
No, the old writing would not work. You would need to add the version as 
in your second example. That will break things, true.
> On a similar thought, "smart install kernel-module-foo" would also 
> work ? or does it
> now require a version ?
>
Also in this example you would need to add the version, even though I 
have only used apt-get and not smart.

The meta package "kernel-modules" will work as before, without a version 
postfix.

So basically, as I understand it, this may be a blocker for this change. 
Alternatives I can come up with are:

1) For all packaged kernel modules, add meta packages that depend on the 
correct version of the kernel module itself. Then "kernel-module-foo" 
would depend on "kernel-module-foo-<version>". The package 
"kernel-modules" would then still be made depending on 
"kernel-module-foo-<version>" and the likes.

2) Make the version postfix configurable with a 
KERNEL_MODULE_PACKAGE_POSTFIX, exactly like the prefix (which was added 
recently). The default would be an empty postfix, but it could be used 
to achieve this functionality for those who need it.

No. 2 is a very simple change. No. 1 is more uncertain (to me at least).

/Ola


--------------4856298D7F8F3C6FDD85C378
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <br>
    <div class="moz-cite-prefix">On 01/09/2017 06:20 PM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote
cite="mid:CADkTA4PFOUmv3W8stkhDmewwDfBE+efZEVym903937jz6eAo7g@mail.gmail.com"
      type="cite">
      <div dir="ltr"><br>
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div>The functionality you describe is a good thing, but I
              have a few questions to make<br>
            </div>
            <div>sure I understand the change, and confirm that existing
              functionality isn't broken .. <br>
            </div>
            <div>and that the internals of the package management do the
              right thing (I'm not an<br>
            </div>
            <div>expert on those internals .. so bear with me).<br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    I am not an expert either so I thought I'd suggest this since it
    works for me and see how it is received.<br>
    <blockquote
cite="mid:CADkTA4PFOUmv3W8stkhDmewwDfBE+efZEVym903937jz6eAo7g@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div><br>
            </div>
            <div>With this change, do you know if
              RDEPENDS="kernel-module-foo" still works ? or<br>
            </div>
            <div>does it now have to be
              RDEPENDS="kernel-module-foo-&lt;version&gt;" ?<br>
              <br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    No, the old writing would not work. You would need to add the
    version as in your second example. That will break things, true.<br>
    <blockquote
cite="mid:CADkTA4PFOUmv3W8stkhDmewwDfBE+efZEVym903937jz6eAo7g@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div>On a similar thought, "smart install kernel-module-foo"
              would also work ? or does it<br>
            </div>
            <div>now require a version ?<br>
              <br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    Also in this example you would need to add the version, even though
    I have only used apt-get and not smart.<br>
    <br>
    The meta package "kernel-modules" will work as before, without a
    version postfix.<br>
    <br>
    So basically, as I understand it, this may be a blocker for this
    change. Alternatives I can come up with are:<br>
    <br>
    1) For all packaged kernel modules, add meta packages that depend on
    the correct version of the kernel module itself. Then
    "kernel-module-foo" would depend on
    "kernel-module-foo-&lt;version&gt;". The package "kernel-modules"
    would then still be made depending on
    "kernel-module-foo-&lt;version&gt;" and the likes.<br>
    <br>
    2) Make the version postfix configurable with a
    KERNEL_MODULE_PACKAGE_POSTFIX, exactly like the prefix (which was
    added recently). The default would be an empty postfix, but it could
    be used to achieve this functionality for those who need it.<br>
    <br>
    No. 2 is a very simple change. No. 1 is more uncertain (to me at
    least).<br>
    <br>
    /Ola<br>
    <br>
  </body>
</html>

--------------4856298D7F8F3C6FDD85C378--
