Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0BB71601F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 12:44:43 +0000 (UTC)
Received: by pabkd10 with SMTP id kd10so5320701pab.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 05:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=0asRMcEtCBHpqTJd/S+bhz5GWtX22qz4AykwjafnsOQ=;
	b=RdOMnnF2Da1EucWp97Cyj4+aiAI0KBlcf3GIZsOkckpVNgI79P8xa5JfLoZhm4U+rz
	jrhY84Sdy3+08Towx46LRoiONKDYChutahP8edRQ0YJT+CbOzRoqsxhlwJgXpDNf6AXa
	NHo0yZEsqpVzBtln4o6KMcsw4iyOCe3q7tDoy3vHTvY4BT7TqLTykfu1aob6f7DvGZND
	WoAebI5rql0pndjQ1jHmnAgqXsul08Br0VfQWpjPp0TRpZJiMlvI0sfprz/DuXyLynpr
	0I124VcYKKTl3SHMLB8/hxZcw55nyX8+AqUA0KV5UkDX9cFQSr/NVD96a/zneSstRynl
	dkHw==
X-Gm-Message-State: ALoCoQkbNG0vj/1FpTR4MQNLqLnzQCBKCFuasXUVHvnTMdiCuT2GN4HGyn2gVHE/ouDNYZoJNFOz
X-Received: by 10.66.250.226 with SMTP id zf2mr15622150pac.20.1438173884215;
	Wed, 29 Jul 2015 05:44:44 -0700 (PDT)
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com.
	[209.85.192.177]) by smtp.gmail.com with ESMTPSA id
	qn7sm40902125pab.14.2015.07.29.05.44.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Jul 2015 05:44:43 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pdbnt7 with SMTP id nt7so5571359pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 05:44:42 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.70.118.163 with SMTP id kn3mr75807652pdb.115.1438173882146; 
	Wed, 29 Jul 2015 05:44:42 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Wed, 29 Jul 2015 05:44:42 -0700 (PDT)
In-Reply-To: <CAP9ODKqiivRLubz=kW+A5Xp66EW7NWPGqs9oscscHYz+TwUc9A@mail.gmail.com>
References: <1438194339-13618-1-git-send-email-b54851@freescale.com>
	<1438194339-13618-5-git-send-email-b54851@freescale.com>
	<CAP9ODKqiivRLubz=kW+A5Xp66EW7NWPGqs9oscscHYz+TwUc9A@mail.gmail.com>
Date: Wed, 29 Jul 2015 09:44:42 -0300
Message-ID: <CAP9ODKra5tcGF5_TNoK6=bvpAD8_MNEkkMuNVwG5KMjLjm1Lpw@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>,
	Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH v4 4/5] gstreamer1.0-plugins-base: Add GST_VIDEO_FRAME_MAP_FLAG_NO_REF related patch
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
X-List-Received-Date: Wed, 29 Jul 2015 12:44:44 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 29, 2015 at 9:42 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Wed, Jul 29, 2015 at 3:25 PM, Yuqing Zhu <b54851@freescale.com> wrote:
>> -Add GST_VIDEO_FRAME_MAP_FLAG_NO_REF
>>  This makes sure that the buffer is not reffed another time when
>>  storing it in the GstVideoFrame, keeping it writable if it was writable.
>>
>> -Use new GST_VIDEO_FRAME_MAP_FLAG_NO_REF to replace the old one because it's kind of ugly.
>>
>> -Don't ref buffers twice when mapping
>>
>> Signed-off-by: Yuqing Zhu <b54851@freescale.com>
>
>
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>

Carlos, please check this one. This seems to be fine but ...

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

