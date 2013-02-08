Received: from mail-ob0-f182.google.com ([209.85.214.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1U3uB7-0002qY-Fn
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 21:05:04 +0100
Received: by mail-ob0-f182.google.com with SMTP id va7so4306939obc.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 11:48:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=Bf+g6BbBXR7TQWg9lEBExNenAvNyUhTap/mFKpD4Tm4=;
	b=kTzCKe3Tr7QzUVtFJlgqHZcfie/mN0qBBAy3Z+6rgWorWKRWUq4z5JNUEVQ3r+PYCL
	1DQFoVu+JkE3u7WJ3NRJOCeTB/vi9/hZm41XCtD3lblAODpOSV6ikdSeNpdoppz9qypp
	8BwtklLJ4ycbrPoJkWq53ZmgllX+MZr2f3oXvCe1pc1smgAv/+zFwniGAOwFUn1gTLsu
	Od6gVFQwbw9UkSwB6bJs9h2llgwWx5HEbq4TSpBTnba71q6flm93OJrW/wPawOsJWUxF
	P8Xp+0wYragQgaIw2Aag0OyERzZ8WEhGxvYH3pE+eQZukcCi3L4TIk/+56Kra2RL9t4W
	k2bw==
X-Received: by 10.182.8.70 with SMTP id p6mr5065403oba.90.1360352894835;
	Fri, 08 Feb 2013 11:48:14 -0800 (PST)
Received: from [192.168.48.44] (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPS id rn9sm38823304obb.11.2013.02.08.11.48.09
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 08 Feb 2013 11:48:13 -0800 (PST)
Message-ID: <511556C4.9080108@felipetonello.com>
Date: Fri, 08 Feb 2013 11:49:24 -0800
From: Felipe Ferreri Tonello <eu@felipetonello.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1360090154-26766-1-git-send-email-ftonello@cercacor.com>
	<51115E97.1080404@linux.intel.com>
	<511182A9.2060702@felipetonello.com>
	<0CB2DDB0E2D34358AAD3481B8F78E9F1@intel.com>
	<5112D7D3.6020304@felipetonello.com>
	<CAP9ODKrBmqnOgRH0FhvuEvS-narJuQA_RLOLfBjjOsSPZa07ig@mail.gmail.com>
	<CAJTo0LYtmvmEXQ9hu_ktj+TC+q4wB_6UgXA1onDxM3P3Wo4UFg@mail.gmail.com>
In-Reply-To: <CAJTo0LYtmvmEXQ9hu_ktj+TC+q4wB_6UgXA1onDxM3P3Wo4UFg@mail.gmail.com>
X-Gm-Message-State: ALoCoQm5wcdgZmjo34RdlzFBDpgmr+opDt6phjmTMxb6ZNrv018WcIY0VqPLWwIy/3loAn9JbX4Y
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: added recipe libconnman-qt
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
X-List-Received-Date: Fri, 08 Feb 2013 20:05:05 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/08/2013 03:10 AM, Burton, Ross wrote:
> On 8 February 2013 11:05, Otavio Salvador <otavio@ossystems.com.br> wrote:
>>> So what was decided? Should I re-send the patch with what path?
>>
>> Until something inside OE-Core uses it I would prefer it in meta-oe. Ross?
>
> If it were connman enabling in Qt directly I'd say oe-core, but as
> it's a separate library meta-oe is the right place IMHO.

But where exactly? meta-oe/recipes-qt/libconnman-qt?

Felipe



