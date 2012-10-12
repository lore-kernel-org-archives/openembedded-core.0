Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TMdIV-0002ED-L6
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Oct 2012 13:20:55 +0200
Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 12 Oct 2012 04:07:21 -0700
Received: by mail-ie0-f175.google.com with SMTP id c13so4595926ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2012 04:07:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=KfbasmyPtPHhL3gkOOGWnIil7ABVvEIPR/M3G18HQLQ=;
	b=bTASE/MQT1Shmqt6Kn9lX9s8aVgb49Mkct8Dk7pOuz7qRm1CG1q9LCms0KckLfUeBY
	9Ba1WgRfrXLpS4x1EmFYEqXEb5VQ7BVhlmsvxDl65ZSjlpjcXm/Y3xWvz/ypIwflvncH
	p2V3YQFbm/5/DrCWYKIDG2Qyg4nuPxgq0nA84X8hmYITxMRa/kQkUZ4QGF2c0E88bDeI
	ZlkADVmg7iXLYpDypfjy/Y6K/O8kMzqpwvoBmMi93Vxb+LHOIPsLfCg6JYHgFudiHOwE
	95d5A9TwEudUDIb/KE4DP4/fuBhUtlnpzAS9pQa0uFgNu1Qg9znROTSG+cRMUY2O+TM5
	ESvw==
Received: by 10.50.7.212 with SMTP id l20mr1817367iga.43.1350040062054; Fri,
	12 Oct 2012 04:07:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.141.70 with HTTP; Fri, 12 Oct 2012 04:07:21 -0700 (PDT)
In-Reply-To: <1349040515.4422.64.camel@x121e.pbcl.net>
References: <1349027303.4422.63.camel@x121e.pbcl.net>
	<430F096FEBAC48CB95BE1DE3D0F1A5CC@intel.com>
	<1349040515.4422.64.camel@x121e.pbcl.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Oct 2012 12:07:21 +0100
Message-ID: <CAJTo0LZrWurnm-BxoBYK9oZsBChA-zqAYR7WdtN6U0X7sqwSrw@mail.gmail.com>
To: Phil Blundell <philb@gnu.org>
X-Gm-Message-State: ALoCoQkza6ZzhBIZgtuZ35ng+AmxvjqqToLUaVgji8e0MoLOPsfzw7gKfM9RPHOtaX27aniDsHYF
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] pango: don't try to split modules if none were installed
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
X-List-Received-Date: Fri, 12 Oct 2012 11:20:55 -0000
Content-Type: text/plain; charset=UTF-8

On 30 September 2012 22:28, Phil Blundell <philb@gnu.org> wrote:
> On Sun, 2012-09-30 at 19:31 +0100, Ross Burton wrote:
>> As this keeps on cropping up, I did have a patch to do_split_packages
>> that added an allow-empty argument. Might be worth digging out.
>
> Sounds like a decent plan.

So do_split_packages() effectively has this if you set recursive=True,
as os.walk() returns an empty list if you pass it a non-existent
directory (it's documented as ignoring errors from os.listdir).

So, what is the behaviour do_split_packages() should have if the split
root doesn't exist - should it error, ignore, or there be an option?

(note that pre-automake 1.12 this rarely happened because the
directory would exist but be empty, now with 1.12 it doesn't install
empty directories)

Ross


