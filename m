Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f196.google.com (mail-ot0-f196.google.com
	[74.125.82.196])
	by mail.openembedded.org (Postfix) with ESMTP id BEEE4786E1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 13:22:11 +0000 (UTC)
Received: by mail-ot0-f196.google.com with SMTP id f100so4207699otf.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 05:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=L2uaTxAWFTnqZ9aZd+/tNEv/j63k2kAyXBllcejdEVE=;
	b=j7LWaWzyVXlwz3WZoVHOwNlaj8yh1PgptIIVrnVoyHfzEzvRmGpfek7ld+pjdztmxw
	7ndpACbV/IB+xKyqFxsQEL87W1bv4feDu0NeoRxJl6Tt9yg24ak9TQzPE7WRqLJCJUjV
	nVSrWIZUQp4kaUMS9L+CJqD1cQVThJIrCTnaIQKkqr3ICcl3OY4Tt/vWdThUukiHY6MG
	SEku6W2TgFI24yITagZI4p4BjaSt4u0Dn5JhaCv5D4yvaNM3i4Tn4kU00GJzw0QR78JH
	EIA1jkWuXmSS/XFR0cZGLWQqCYyuqWZuPiHCJBBhPvMyY8zV2gYqju/cv+dgT60UI5Hj
	/edw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=L2uaTxAWFTnqZ9aZd+/tNEv/j63k2kAyXBllcejdEVE=;
	b=NHwhWtFUnKuc1rcMUgJTXiSjBNbm8HQuH3rw6f9Ym6H+/GT4vXQ+JZtFHegwOZvkIO
	VTlVTRsEvGJU0kmzZnQp346aCL7a/iM8Huri5i01PetbxHOe3Dzz8qRaPfqvk09J7jAc
	UqXmn5ZzO9OsUB6OcBhwTWBxvH9tt9kyV1IWFwfMC4dDpGAl4ofDCUiSBs1r+S/XyQOc
	QqUgMBUkB/Tt0ybFJ703NilXE6OhGnelHugchrI4rPTtXg4tT8RlnCsjx9Y1F9OYlf8r
	+RQr9v3JIfn4GzNb/2EI3s6folfKS5rbGBaGWVvaXUY1Og8X0Kr0QquhidPL9dpQjxJE
	lJ/g==
X-Gm-Message-State: AKwxytc2eH9zo2Nemx6acafeGa8Guj6VNsPtTsC3GnO0by4vdXwkhGQD
	9Nh/YTOsiPEK2uCqjNaOeuy2b+DD
X-Google-Smtp-Source: ACJfBovgcht+0xTvrUbEZmpzma6bIfAi+iwQyxwVXaYVolwkiv3qu7jCoWggl82K8pwTIcx3ey7KTg==
X-Received: by 10.157.1.236 with SMTP id e99mr1058986ote.148.1516195332415;
	Wed, 17 Jan 2018 05:22:12 -0800 (PST)
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com.
	[209.85.218.53]) by smtp.gmail.com with ESMTPSA id
	l79sm1837275oig.41.2018.01.17.05.22.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Jan 2018 05:22:11 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f53.google.com with SMTP id m65so13090570oig.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 05:22:11 -0800 (PST)
X-Received: by 10.202.195.71 with SMTP id t68mr1094367oif.216.1516195330759;
	Wed, 17 Jan 2018 05:22:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.38.102 with HTTP; Wed, 17 Jan 2018 05:22:08 -0800 (PST)
In-Reply-To: <CAJTo0LYONEvXNkEYzanBQXseap_vG=5BA9sRbRtXsK+PdwLwHA@mail.gmail.com>
References: <20180117131155.2297-1-otavio@ossystems.com.br>
	<20180117131155.2297-3-otavio@ossystems.com.br>
	<CAJTo0LYONEvXNkEYzanBQXseap_vG=5BA9sRbRtXsK+PdwLwHA@mail.gmail.com>
Date: Wed, 17 Jan 2018 11:22:08 -0200
X-Gmail-Original-Message-ID: <CAP9ODKrpR3c2a-8rwoCQOV_RztL_SJFDDgU6qvhZwQBB-5wnWg@mail.gmail.com>
Message-ID: <CAP9ODKrpR3c2a-8rwoCQOV_RztL_SJFDDgU6qvhZwQBB-5wnWg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 3/3] cmake: upgrade 3.9.5 -> 3.10.1
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
X-List-Received-Date: Wed, 17 Jan 2018 13:22:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 17, 2018 at 11:16 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 17 January 2018 at 13:11, Otavio Salvador <otavio@ossystems.com.br>
> wrote:
>>
>> Changes in v2:
>>  - add make-native dependency
>
>
> I can't see a dependency on make-native anywhere, and we've always relied on
> the host make so why do you need to do this?

Sorry, end not adding it to the commit. I sent a v3 including it.

I believe it is looking for the utils inside sysroot now. Do you think
it makes sense to avoid the dependency?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

