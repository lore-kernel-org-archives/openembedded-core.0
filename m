Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 990E565EDC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jun 2014 09:42:51 +0000 (UTC)
Received: by mail-qa0-f53.google.com with SMTP id k15so705746qaq.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jun 2014 02:42:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=WwcTo/BABnhv9DZXF1eyclxyiqM3D/ExUeVHLAvYpFE=;
	b=aFrfiSdpyY10+ESAP8sbhNNkq4diRKS1x6EQz4iZkJTfai7QeFXcyYNJOZ03A6P7y1
	kr/uCYIr7/pqTl9OgpdtVo4HVkx0YuvE1PNhx/rxKiA/KMjcY/XBxC1Klkb7YZnN0gAA
	ZMv/0JIIbthb0lgNWnNmYAOumKsMfC3+ijlHknSb1mWj0ec4MFVOOOQZ8PR4RhQNPuDH
	Npn/DCSiqv4s59XxgFlHfvN/60OyYfhilqqW9Giq7+ZoVLVOlAMsO404ARwiijUSombS
	IGWpeIhV+ifvsx9P44nGOrCA20r7uqJmwOkLXKbeoMYplHrr67hMaNNaTdhCNVnvSekC
	JV5g==
X-Gm-Message-State: ALoCoQnBW1tYzPPIlaxVCREYLuCmmphxTXLxh+jGTjTVR7+e4duRUWMwx5T4L+AgNpuOhvw7rZwt
X-Received: by 10.224.151.206 with SMTP id d14mr15304150qaw.35.1401961372815; 
	Thu, 05 Jun 2014 02:42:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Thu, 5 Jun 2014 02:42:32 -0700 (PDT)
In-Reply-To: <e495f3e49d33bd3b855c8eb91206622e0f2e3d14.1401945914.git.Qi.Chen@windriver.com>
References: <cover.1401945914.git.Qi.Chen@windriver.com>
	<e495f3e49d33bd3b855c8eb91206622e0f2e3d14.1401945914.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 5 Jun 2014 10:42:32 +0100
Message-ID: <CAJTo0LbN9V7f29md9LNEA5aG9NaLHG6ZiKt8m_72wO=E9hkWpw@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/3] gawk: upgrade from 4.0.2 to 4.1.1
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
X-List-Received-Date: Thu, 05 Jun 2014 09:42:52 -0000
Content-Type: text/plain; charset=UTF-8

On 5 June 2014 06:29, Chen Qi <Qi.Chen@windriver.com> wrote:
> +FILES_gawk-common += "${datadir}/awk/* ${libexecdir}/awk/* ${libexecdir}/*.so"

Gawk doesn't install extensions into libexecdir, but $libdir/gawk:

AC_SUBST([pkgextensiondir], ['${pkglibdir}'])

They may end up in the same location but that can't be guaranteed for
all time (especially when I have a series that changes libexecdir).

Ross

