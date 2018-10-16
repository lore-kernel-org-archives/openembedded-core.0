Return-Path: <ross.burton@intel.com>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id A4BAC60103
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2018 10:38:12 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id s69-v6so17582509oie.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2018 03:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BekSBKN9tqW/SUP9nkN5nBCz5FaIXzi+7HJ5VydBPPU=;
	b=eFwmi6nvY/yYnp/zPhY3GZAQ2KuStEjhizMHmwv7bTDP7N8sMw4tUhKR+A+UYa3Kwa
	dY+/kuGLKacCedEwKZMtb+SXPpmFMRcNcoGDgATkJMu0MHAtrKFtvINlcNLHPVteUSla
	IRyWQoewZ2hWBzT642v+cVPldxcTz/qSQWCnhMIdo8utPiW+LQT4VZzhLHxOG1u92j3D
	+aWBf/FsHOzSaJZ0WyVk7IIOmfttXOnO/5pFHa9U8XJuA/lWwFYNDv5mVIuC1lBOOE6Y
	YFdYcPyNABKk2ElD+VwgBbF0oBRxJ+bIQQc37W0baxdKVILSXs5Cnu68gbzUNnrpK4oK
	H1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BekSBKN9tqW/SUP9nkN5nBCz5FaIXzi+7HJ5VydBPPU=;
	b=LLmVipZxhz1E/aD47ScarStrrSdmuII7LOuyD4znC8oNCwfJMitIBW/2F7/gTF7BQy
	Z+He/Yi87Y0HxXUtjG555VGUl9RvGb5RPXZ55WUHOErKyxicGahTVy5deXBSyI6QhePN
	b51t8nmgz6nfmA/hhAV/ZqHBq1iLkvF9qP51UyKHalAaGNLVYhhV689RBkuydjwVlPgZ
	KJRYN333ekAq79PRTD/WowubOyk8hfHg0dL3GKrdr/BN4jN6DcStahs/6RIgO2ngPwMf
	rdwTmhE4A5zGM6uj0r/vtowcAtt8j1XCPHAy+F87zrkaVGgi4FrsPILvsZe+OyKOjpth
	NsLg==
X-Gm-Message-State: ABuFfoiPkSfyUQSjThuhsVGtPXMSsOCrbP31aZyyYVR2+Xc1WA7BmFU6
	DB3IP7V1ql8Hc4vL206QBL8YnjBkULm5aekow80aYg==
X-Google-Smtp-Source: ACcGV63GOqKYcw0wJ1WJETBu/eo3y+4BDkA4IzzMLD/ArYOqzHCQx8iVauxACrcmszlhEq7aWu71jzxFAjTXXzX0zyw=
X-Received: by 2002:aca:f0d6:: with SMTP id
	o205-v6mr10561936oih.138.1539686293457; 
	Tue, 16 Oct 2018 03:38:13 -0700 (PDT)
MIME-Version: 1.0
References: <20181016090054.122374-1-mingli.yu@windriver.com>
	<fb67373823b7952f1acf022bed6bd40611c74754.camel@linuxfoundation.org>
In-Reply-To: <fb67373823b7952f1acf022bed6bd40611c74754.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Oct 2018 11:38:01 +0100
Message-ID: <CAJTo0LbbgiiPQSanVFuibf2PpYmVr9t1vebxZD6OT7DF+BdhDw@mail.gmail.com>
To: "Purdie, Richard" <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] boost.inc: make libboost_python3.so available
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
X-List-Received-Date: Tue, 16 Oct 2018 10:38:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Oct 2018 at 11:01, <richard.purdie@linuxfoundation.org> wrote:
> I'm a little worried about why we're having to create these links when
> other software seems able to expect these things by default. Is this
> some standard packaging most distros do? I'm a little worried we're
> creating an ABI here which doesn't exist...

https://koji.fedoraproject.org/koji/rpminfo?rpmID=14904908 says that
Fedora's boost-python3 package contains just
/usr/lib64/libboost_python3.so.1.66.0.  Their spec file at
https://src.fedoraproject.org/rpms/boost/blob/master/f/boost.spec is
hairy (as one expects for Boost) but doesn't appear to rename the
file.

So the question is why does our build produce libboost_python35.so?

Ross

