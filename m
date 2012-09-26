Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TGsYj-0002kf-Co
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 16:25:53 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 26 Sep 2012 07:12:47 -0700
Received: by obceq6 with SMTP id eq6so625134obc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 07:13:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=dzDnGQE8n1JyF4KBNrwbImlBNdEiE4H+tDcHJG4wK24=;
	b=SmwMp4yYxQ5TTT4GDJ9mNYAFHAyBNtfT75tRUvUS4mMy6iZby8zXoXTaO0G2QZrs1W
	WmtrJndwRGXYJyEGSp6gZLP8PdeNGFFmjJtD9wQ4BkhSavPKVJfJHuhPTpSUvDUMVsVQ
	d60k3kyhsuNFMlWg/Ug0g/6Q94cT20sRTkT/8tUEF0ubysjgCkl/0ZU72bn79KdRLuFO
	jiTpNu5sOx9VPwZOjDO0dWx0W78xWxVyNKdpiIrFn0ctC8nhiFx8o4Qk12NkXTOpmzN/
	vQUWVX2ZwqTKrIDd3TyY7gFpE9X7PVPy/S+ZAssn2AxSkfH0mOXnmCoWAw4L0M9R0RrA
	0FFw==
Received: by 10.60.28.6 with SMTP id x6mr543265oeg.61.1348668780720; Wed, 26
	Sep 2012 07:13:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Wed, 26 Sep 2012 07:12:40 -0700 (PDT)
In-Reply-To: <1348663741.31293.114.camel@phil-desktop>
References: <1348663741.31293.114.camel@phil-desktop>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 26 Sep 2012 15:12:40 +0100
Message-ID: <CAJTo0La28g_t84Ku+LbLKLVfwyRL-KuCpq3GuYWxLbnu4-NYkg@mail.gmail.com>
To: Phil Blundell <philb@gnu.org>
X-Gm-Message-State: ALoCoQnNqiNGi4cPB/RTHvWlcROCQHsq4/EVWdAum1vWbls1cpk3OZkVWV4m+SueunQ//BM7ff7U
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] glib-2.0: Update to 2.34.0
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
X-List-Received-Date: Wed, 26 Sep 2012 14:25:53 -0000
Content-Type: text/plain; charset=UTF-8

It's a bit late for this oe-core cycle I suspect, if we'd been
tracking the 2.33. releases that would be a different story, so maybe
we'll do that next time...

Also from glancing at the NEWS, we should be able to drop some of the
cross-compile patches.  Did you investigate this or just refresh the
patches?

Ross


