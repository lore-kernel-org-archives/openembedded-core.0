Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SyJud-0000Ti-8Q
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 11:47:47 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 06 Aug 2012 02:36:01 -0700
Received: by obbuo19 with SMTP id uo19so4826487obb.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2012 02:36:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=quZPngsofr17FJkSvJDFP9Ut2+xvCcfQXXtFcHCYjqM=;
	b=PVSgMvzE8xTHCaAjKjUVnftJdJDvF4L+y8Yh+2M8byalPWyoalydgAFbEqvtUBbVa5
	TzkNa6kyNAG8Auj3exOnzC+w+CBjD259+ATaf91HCRZTnwjtNwD9e2NKT7rY6oTn+U4K
	fS63HeN+Df/m3v1AsbWAjn7txynNOtjqTenPqSDPyaacsuOwz77iRvmnmSkMZTUdKGRf
	3XaeqMDcnIKA41FBQ7OYPNog6RV1mb0xHAj96vdm79cUYLnEHKp8cZ62k0vcOU4Z65B1
	Trp+ZKsggHsSgoE1OCSEkzwoCSuoUdpAD16JTc5z/aV2xQn4rMBHz59fu6WDjQAY7F7T
	szzw==
Received: by 10.60.2.99 with SMTP id 3mr17991028oet.20.1344245760683; Mon, 06
	Aug 2012 02:36:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.45.10 with HTTP; Mon, 6 Aug 2012 02:35:40 -0700 (PDT)
In-Reply-To: <501F8BEC.4080204@intel.com>
References: <cover.1344022584.git.laurentiu.palcu@intel.com>
	<b41b2c46c9de5d3f63bfa146e23e8974a7a6cebf.1344022584.git.laurentiu.palcu@intel.com>
	<CALbNGRQjUxm0h2+YA=Tog2_JhWPKGJmdy9QyhOjSQWLRQ1eKOQ@mail.gmail.com>
	<501CD3EE.3080100@intel.com>
	<CALbNGRTJM5=Xt4NqoEuEQa2U-eMtmQzy42HmwRK0zvkq-zK-3Q@mail.gmail.com>
	<501D2B2B.6070806@intel.com>
	<3103BB42-D7DD-456B-8733-9A019CA66E99@dominion.thruhere.net>
	<CALbNGRRLGToMpW2tCzdtEcpZmAmgK3d2VKF0SVi-hgBanFOexQ@mail.gmail.com>
	<CAMKF1spXi6PqV6ZLqLPMUE0oEF2Sou+Jst-QME-XhLoCANeaPQ@mail.gmail.com>
	<501EA63F.9090304@intel.com>
	<CALbNGRTmwH0yLJRQUrDUKBxLvC9bv7cE15_rnu50CCzDsUw0UQ@mail.gmail.com>
	<CALbNGRTevoBvucXfRxYi33_y48V=Bo237s1Knjhy2eFJzjfmvQ@mail.gmail.com>
	<501F76BF.9000605@intel.com>
	<CALbNGRSOR2wxo7jetrEAYAZesSBiLPqVxJx0r22Xzmfxb3D=3g@mail.gmail.com>
	<501F8BEC.4080204@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 6 Aug 2012 10:35:40 +0100
Message-ID: <CAJTo0LaKzKPT-_OsQEi+6xc47DVr=rELN2ZbBqDX7pP9rVg-Yw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkyq+MCgUFOs6sl6I9io5KcwMclxEToqPcwS6H0J/IpGib2tTxlSBnNRpsvQdwDpihH9ATJ
Subject: Re: [PATCH 4/5] gtk-icon-cache: call postinst scriplet at do_rootfs time
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
X-List-Received-Date: Mon, 06 Aug 2012 09:47:47 -0000
Content-Type: text/plain; charset=UTF-8

On 6 August 2012 10:18, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
>> Which hardware did you emulate? My tests were done for overo (ARM
>> cortext A8). I wonder if the created database is machine specific.

> I used qemuarm. As far as I know, the database shouldn't be machine
> specific.

Looking at updateiconcache.c, all of the functions that write data to
the cache file use write_card16, write_card32 and so on which convert
to big-endian.  Unless there's a bug hidden away, the cache files are
cross-platform.

Ross


