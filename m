Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9178278596
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 16:18:12 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id e195-v6so3206402ita.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 09:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=X++cRrUi6kRVmNmriIcEg8nYg9QUC30YRUjoChKRqV4=;
	b=oQILQ9dfEWdonxUQn1uh8E96SE+WdbGGDyac172IAGiRIgAsFtF5nwckaYF17a4E68
	z8IrySRb7Kj3uIYemK9j2MpeZB8mUqIeabMfp8/GTwIzypCbX8tzNL5cL5+CazpX5gxS
	UoEGM9mOh6aAAdOb2aAGKQ95f+eXj5HkWFvkLCSAVTSw6FG8PcHk3xVokHerlpqlZdcC
	PHgpMbZXMAwh+QH4xz+zy+28DpFUZ/pODwdHU2MRdfYxmVeLpbV5S26utDqJM1CTe/iz
	jGM610b/L9XuU+drF+848v1rMuhRswWPzm4gxLDyEbNOFcStdxoLbXdme/8wi2Kv1Usb
	X/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=X++cRrUi6kRVmNmriIcEg8nYg9QUC30YRUjoChKRqV4=;
	b=iVQ8Njxh4UJKwt/RugyC8Wzu2yTrJZBErkGioWwaQfv9il0sSnc+NtDkAmA0sApGrw
	4/Al8DjHSB8ESyyaDd6AtWGEqxyZwiqj7r9jM6mQmeXoF46TVy1StmCMelHixNszPiGT
	Susfn+VKOYTW2CQkuI81dgLstgIxlKv+rnep94kWs9oNOKkuzhGKLeC74/ZzX4NvcKCB
	q/wSWjymfeFxFEePXys8+3gD2x4t6mR7zatkjMLiIIo5YoABzAWkb9bP2lig+DIWIBEY
	lgXGzCxYrldA7qFJYJYEgCIDpbJ12ZXnIAYEIb581txZ3QyXeyp0Gpl4Pp2cB4OuokzY
	A8vg==
X-Gm-Message-State: AElRT7Hu5Sm1Gc0IuE00F5hNy0lseHBTGKvJU7lpgjUkaLnjZco4CEbV
	fYrKoc0rsv60Sghu6kRbiaD4odQsE5v+sFwcqdP1PA==
X-Google-Smtp-Source: AG47ELuayYn9IckDH+UK6g/e5FY9Pk7GfbP55DogCt7NqPWX2glHzxDcQuraB67Ax4e4jKuiyGyyCUR+07rerBTAUjQ=
X-Received: by 2002:a24:f685:: with SMTP id
	u127-v6mr13402253ith.131.1521821893679; 
	Fri, 23 Mar 2018 09:18:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Fri, 23 Mar 2018 09:17:53 -0700 (PDT)
In-Reply-To: <lyd0zurcw4.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<lyk1u2re5q.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LaU41nPj1U2puHTvW272u0skdFk-gkuz3_-hXWWbxEqAg@mail.gmail.com>
	<lyd0zurcw4.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 23 Mar 2018 16:17:53 +0000
Message-ID: <CAJTo0LaLDfEuYPZEU7r1pPEmP5RY9gCpZFVOrdK-XBvuOmu3Tw@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>, Seebs <seebs@seebs.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: pseudo: host user contamination
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
X-List-Received-Date: Fri, 23 Mar 2018 16:18:12 -0000
Content-Type: text/plain; charset="UTF-8"

On 23 March 2018 at 16:10, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
> "Burton, Ross" <ross.burton@intel.com> writes:
>
>>> do_install() {
>>>         install -D -p -m 0644 bar ${D}/bin/bar
>>>         install -d -m 0755 ${D}/usr/bin
>>>         mv ${D}/bin/bar ${D}/usr/bin/bar
>>>         ln -s /usr/bin/bar ${D}/bin/bar
>>> }
>>>
>>> FILES_${PN} = "/bin/* /usr/bin/*"
>>> ---
>>>
>>> WARNING: foo-1.0-r0 do_package_qa: QA Issue: foo: /foo/usr/bin/bar
>>> is owned by uid 505, which is the same as the user running
>>> bitbake. This may be due to host contamination
>>> [host-user-contaminated]
>>
>> Works for me: install correctly changes owner to root:root as it
>> should.
>
> I think, 'mv' is the culprit.  It calls 'renameat2()' directly over
> 'syscall()':
>
> | $ ltrace mv foo bar
> | ...
> | syscall(316, 0xffffff9c, 0x7fff1564a341, 0xffffff9c)                                            = 0
>
>
> Perhaps, 'pseudo' does not catch this?

I suspect that would do it as pseudo is basically a glorified LD_PRELOAD.  Sigh.

CCing Peter, pseudo author.

Ross

