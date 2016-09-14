Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yb0-f170.google.com (mail-yb0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9BC5C602D9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 21:06:15 +0000 (UTC)
Received: by mail-yb0-f170.google.com with SMTP id d69so23504626ybf.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 14:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=neUXfSCB/98+YDuoZaEu3ekX0805ZjYK0L7TcwOhzWo=;
	b=WGKzCiXEXGYdw5XhrshI4EbW0BoCdirL421m2K1kfOWgQUTtVKUMzFAV4PAP91xNVh
	GXHDhLkPP3qZlL5ndOhIBYgQ3IKjzEYZqIHGh17Z+Hvojmz8HFon6UVnN837FFuzkaNK
	VaqhN6z7FCS4VpgvUWoyz/YSO5w7255pynLoCzarAc/5g1tlETnLexX2G5JOaI2wmQIS
	QG7WN9VqtkiDvZV6z+NjQYzMqehd8Ceqy1hjW4ztCKBg+O+L0k4uOl+Z8npwUInBjCL0
	lDOkPe+P6++EdhpHiz6XCnoaDlKRP0/JCnJhGzqWSZ5t37dAvGeo7s28+VqzJrfrsv1x
	DmHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=neUXfSCB/98+YDuoZaEu3ekX0805ZjYK0L7TcwOhzWo=;
	b=hDAQ+D5Vxvrouxs6zyVLGX3BMZZXV0Ht360m5exO3HyE8hRAOzvuXdXOAfb3omaQO0
	KLb5fYc/VkeGU4yV62umk6YCDeF1bL2OgLnDfRmWGxFwU5IsRl+yjUhXs81/gbudMoWZ
	cAetDu788uiPlrgR8eUigjMxicuxAVtm6ItgptChKdgTRnWLoMclV6CceDGQxgoBLlbF
	COMau/wIjG+aUhzcK6YRNgnYfNm9m+NaTN728ibnCJmhU2PWUWFzTnatN87TphxamPf0
	7ym3aCWvw7obarNM52XRMXguyJXE1zJC+0MLc+RQxpy/QZ4PMg6pYVxe65gGdSRZZGy+
	Nd3w==
X-Gm-Message-State: AE9vXwPu42u8iGkgw1dmJz1rIsve9lVprC3eGnvUtLLrjVJGFb0YcjSvlBjUvQHs2bETVg==
X-Received: by 10.37.58.131 with SMTP id h125mr5285904yba.49.1473887175602;
	Wed, 14 Sep 2016 14:06:15 -0700 (PDT)
Received: from mail-yw0-f170.google.com (mail-yw0-f170.google.com.
	[209.85.161.170])
	by smtp.gmail.com with ESMTPSA id i71sm44652ywg.54.2016.09.14.14.06.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Sep 2016 14:06:14 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-yw0-f170.google.com with SMTP id i129so42660295ywb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 14:06:14 -0700 (PDT)
X-Received: by 10.129.108.147 with SMTP id h141mr5743617ywc.214.1473887173956; 
	Wed, 14 Sep 2016 14:06:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.154.68 with HTTP; Wed, 14 Sep 2016 14:06:13 -0700 (PDT)
In-Reply-To: <CAJTo0LYK=k1bFjbbBcDEu+RJ5zHFvogOsNmeYHnFJnjiM3AVRQ@mail.gmail.com>
References: <1473871297-28966-1-git-send-email-ross.burton@intel.com>
	<1473871297-28966-2-git-send-email-ross.burton@intel.com>
	<CAP9ODKowGs-bZ2oyAmUn4=b6BCZPZKR9vhS9Hd==etoU5o2Pvg@mail.gmail.com>
	<CAJTo0LYK=k1bFjbbBcDEu+RJ5zHFvogOsNmeYHnFJnjiM3AVRQ@mail.gmail.com>
Date: Wed, 14 Sep 2016 18:06:13 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqHt2RgF4sD2ai_+2DGfJ9+hu9+by67YBqAyN+=AD=baQ@mail.gmail.com>
Message-ID: <CAP9ODKqHt2RgF4sD2ai_+2DGfJ9+hu9+by67YBqAyN+=AD=baQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] cmake: use convenience options for clarity
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
X-List-Received-Date: Wed, 14 Sep 2016 21:06:16 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 14, 2016 at 5:59 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 14 September 2016 at 18:50, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>>
>> Why jsoncpp cannot be also linked?
>
> Because it's not in oe-core.

Ok; but this means it should be right?

If so, we can work on a recipe for it. It is better to avoid bundled
copies of recipe specially because security flaws...

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

