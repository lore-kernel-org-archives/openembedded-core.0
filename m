Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tb8hZ-0005Iy-Gp
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Nov 2012 12:42:45 +0100
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 21 Nov 2012 03:28:39 -0800
Received: by mail-oa0-f69.google.com with SMTP id j6so35263408oag.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2012 03:28:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=mHpDI0moiyygmbNgAJBAPyyZhTAzY2+o9UL6z0L+nH0=;
	b=h7yoNB8IT9EeotyaT37HJa5LOZRqjm3LbyQWr/+EBBCtw01BCfjkel50y7DiHqcLcx
	0tV+30pE6GQljmdmfnpfGHah4ahryoqHSlG0woyvtikXpIreR6P/guKXNkTykgwWHivB
	U8JXByZVHo0wBQ8etcI6u3hzjc1/7r7EboIssEU1A+3HukO+ZaMWP++oNYNvTVBeAOAh
	gcOD5OS9+KJlqxq36QWygEXGC+4ZYf+o3TQ1dkbkxyNKDcVAoXOg0Igla3mfUmlqlum3
	G1uoZ7jpnJkqb96HIXR3PwuHykrGEt61adqDNkicPGPw7Wyg0ruBTiiNb36hMtgyPkCv
	34Qg==
Received: by 10.182.53.3 with SMTP id x3mr2867350obo.87.1353497318195;
	Wed, 21 Nov 2012 03:28:38 -0800 (PST)
Received: by 10.182.53.3 with SMTP id x3mr2867345obo.87.1353497318098; Wed, 21
	Nov 2012 03:28:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.154.37 with HTTP; Wed, 21 Nov 2012 03:28:16 -0800 (PST)
In-Reply-To: <1353450851-7252-1-git-send-email-gilbert_coville@mentor.com>
References: <CAJTo0LaB=Qhd5wmhhJCRHqL+Fb4=AxSCaPVDi7tqoV_Giwghqw@mail.gmail.com>
	<1353450851-7252-1-git-send-email-gilbert_coville@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Nov 2012 11:28:16 +0000
Message-ID: <CAJTo0LbYNQDXewFXHUwY_=KiDr0FfH-j7jb4xWb+_nY0iS5YJA@mail.gmail.com>
To: Gilbert Coville <gilbert_coville@mentor.com>
X-Gm-Message-State: ALoCoQmMcjtzz0r+ooB0OwnSSNhN3FlMHHPBGYjrFdlXbJzbg6BlBJU2QLinUp+UGbAr4oi1USrASErHtam9ACttLEvZjT527P1oqCZiG3MhXsL/Ovo4jPeIDlzYnOayi1cO6VSSaDIRcmWJvPYAmnke8fSbWFrYHJSTGQ8hfXS1eBoMwv7cw/2vKveE2PyEFwgftIRwrTpR
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] gst-plugins-base: add dep on libsm and libice
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Nov 2012 11:42:45 -0000
Content-Type: text/plain; charset=UTF-8

On 20 November 2012 22:34, Gilbert Coville <gilbert_coville@mentor.com> wrote:
> If libICE exists when this package configures, libICE and libSM are
> added to the list of included libraries.  Adding libsm and libice to the
> list of dependencies ensures they'll be present and makes the contents
> of this package more deterministic.

I suspected this was the reason.  That's AC_PATH_XTRA being stupid as
usual.   I wonder if upstream would replace that with a PKG_CONFIG
call for x11.pc.

Grudingly Acked-By: Ross Burton <ross.burton@intel.com>

Ross


