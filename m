Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1S368B-0006Kk-6E
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 14:33:15 +0100
Received: by wgbdr12 with SMTP id dr12so474665wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2012 05:24:45 -0800 (PST)
Received-SPF: pass (google.com: domain of s.stirtzel@googlemail.com designates
	10.180.83.70 as permitted sender) client-ip=10.180.83.70; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	s.stirtzel@googlemail.com designates 10.180.83.70 as permitted
	sender) smtp.mail=s.stirtzel@googlemail.com;
	dkim=pass header.i=s.stirtzel@googlemail.com
Received: from mr.google.com ([10.180.83.70])
	by 10.180.83.70 with SMTP id o6mr2349149wiy.19.1330608285584 (num_hops
	= 1); Thu, 01 Mar 2012 05:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=8yL282CiHM+h7nOxe4yJVgBbqKmuktVZwiGdU993yLM=;
	b=w8s2qB5f7mVJhgb8oksvQWoHVMpbrme+5ELTKhil2XRRuSl960wzQBJP17ktxY5G9q
	QZjVshGVw7KBkfXIuFvjnxzg1uuMqiJI196bAmsXw7cgmdmnNV3MB19FhANgBGK012cb
	S5I78ybsA7V77cOX7frsrOE9oJT9hb9H+q9XA=
MIME-Version: 1.0
Received: by 10.180.83.70 with SMTP id o6mr1881346wiy.19.1330608285410; Thu,
	01 Mar 2012 05:24:45 -0800 (PST)
Received: by 10.223.104.8 with HTTP; Thu, 1 Mar 2012 05:24:45 -0800 (PST)
In-Reply-To: <CAGiJk9f9Mc06KbPVBcTFi_icr=P3ZGuBYrDT7oH+gC5dKVKpbA@mail.gmail.com>
References: <CAGiJk9f9Mc06KbPVBcTFi_icr=P3ZGuBYrDT7oH+gC5dKVKpbA@mail.gmail.com>
Date: Thu, 1 Mar 2012 14:24:45 +0100
Message-ID: <CAGiJk9cJa7MoHjpTGB0xVbOrcHS=m95PShuHheKaoAYhGrcRdQ@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Porting KDE Plasma Active (WIP)
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
X-List-Received-Date: Thu, 01 Mar 2012 13:33:15 -0000
Content-Type: text/plain; charset=UTF-8

Just to let you know that I'm still working on this.

The git repository (at [1]) shows what was currently done, since
kdelibs builds now it could  be possible to port other programs that
depend on it.


The good and the bad news:
Good:
* Most things will compile and install
* Workarounds should be easy to understand
Bad:
* There are workarounds for cruel hard-coded "where to find and
install" strings in CMake files
* My popularity as KDE developer decreases every time I ask "Why does
package <XYZ> installs it's CMake files into the libdir?"
* ^ Of course this is a joke, but some really do..
* The user has to install kdelibsX-dev (X is either version 4 or 5)
since KDE (like Koen already stated) needs to execute KDE/Qt programs
that depend on the whole KDE stack again in a native flavor.



About the current status:
The main dependency kdelibs builds but in do_package there is a
ominous QA error:
ERROR: QA Issue: kdelibs4 rdepends on kdelibs4-dev
Since this error message is important, it will not help (me) much to
resolve the error.
In other words is there any way to debug this?

Plasma Acttve builds now.
And if the kdelibs QA error is resolved it should be possible to build
an image and test it (hopefully).

There might be some missing DEPENDS entries and the TODO has also some
lines left, but my current priority is to debug the QA error.


[1] https://gitorious.org/openembedded-core-layers/meta-kde

-- 
Regards
Samuel


