Return-Path: <lemagoup@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4D2F97EA58
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 15:58:46 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id u19so361418ior.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 08:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+0Q4+s7Pr0qGBCKh64Mezd27LqiHkfoPFlgiF717zn8=;
	b=Dr4aRk2LM6ZEksCW/PGOuYioR81EmmXohGDVvfVa4FIbhHY+6czLnzbZIX9bfAfqz/
	qEasX8Yaq/HfQGYlY/T9Ng9v5jaIi/x+q3IVmfn8lDIpNm1PjEpkTqw8TsQqyHtLKQCF
	NQ8qX8B3btGnl2w8GpKJCXBpTxeog4jwVru+Y+ZAbgJjmuFktLKGWfnrVfOKySpyRI6d
	OzDsi3ZaD4q5hCx03Zg8cCM6xmmx/khoBXShrpZ6uCReiWRNT+Ph7rKxc343LgeZVLWY
	6o9QmxGlF2y+2Z3ezGY8oqHA5tJ8IovAFt0BXeL1H4ezLFS/9a6yejmOaDSBBs2f79fx
	6YAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+0Q4+s7Pr0qGBCKh64Mezd27LqiHkfoPFlgiF717zn8=;
	b=MBFbiSX/N9vwwzq0pAmjmGp12q1RGqOgmMFiUm8KXw448bBSepBoKeLSgZJtau6O14
	qRn2k1rCxQOSoWFKROnk+dG3mgb/cK0+FcV6cFeWo/KnE8qifnVwV7rBjdewHIhwi4j1
	+HjF1egsyB/V+6hx0j5l4Alkge9OXTD0mkLT++Ug9C2RXB/1WfpQq3MMgFnZNBjmAMTX
	az2d7kLIcT2sjsd9OdeOppRJHH+F0gpZEauLrkRR6CcRbRRuhAUcihn3mpa3QwNVl405
	vgwe7PFQwnPhAYdR18YrZg46nx8Mmamh+OHBfbEG0wwu1Sj6jpgY9gOHv0el7KYVJzKY
	rKfg==
X-Gm-Message-State: APjAAAVOcZ2H7b6Bio2MOZANSDQQ4V8qKMANfMtmdksDw/m6+u9oDGyc
	ZLoBIxsiKpWWzjueU4LQpGSnwS5nx4/8KVQU21E=
X-Google-Smtp-Source: APXvYqxCnjo17wF/RkdkEOJmJQk1Y5OnVn+/Qw1Zbd4R6yhGYegw8c7h+4TUQIXo26P8gIwDBCF+ZrQOIhLRwssyetE=
X-Received: by 2002:a5d:890d:: with SMTP id b13mr54913019ion.124.1560959927288;
	Wed, 19 Jun 2019 08:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190619135940.18544-1-lemagoup@gmail.com>
	<20190619135940.18544-2-lemagoup@gmail.com>
	<CAJTo0La_q0KTZrDQrnyiejgOzGCP0YNqF=tS++5ZYaoVCE+xAA@mail.gmail.com>
In-Reply-To: <CAJTo0La_q0KTZrDQrnyiejgOzGCP0YNqF=tS++5ZYaoVCE+xAA@mail.gmail.com>
From: Pierre Le Magourou <lemagoup@gmail.com>
Date: Wed, 19 Jun 2019 17:58:35 +0200
Message-ID: <CAEz4NHqeaN9pUs-J733LfO3aJ-fvOcKEcp-9xJ9XyyFvsXQOCw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] cve-check: Remove dependency to cve-check-tool-native
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
X-List-Received-Date: Wed, 19 Jun 2019 15:58:46 -0000
Content-Type: multipart/alternative; boundary="000000000000f98c15058baf4d6c"

--000000000000f98c15058baf4d6c
Content-Type: text/plain; charset="UTF-8"

> Does this mean we can delete the cve-check-tool recipe itself too?
>

Yes, with this patch cve-check class does not need cve-check-tool anymore.

Pierre

--000000000000f98c15058baf4d6c
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">&gt; Does this mean we can delete the cve-check-tool recipe itself too?<br>&gt;<br><div><br></div><div>Yes, with this patch cve-check class does not need cve-check-tool anymore.</div><div><br></div><div>Pierre<br></div><div><br></div></div>

--000000000000f98c15058baf4d6c--
