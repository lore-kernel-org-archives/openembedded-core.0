Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TlhOV-0003SU-DK
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 15:46:44 +0100
Received: from mail-gh0-f199.google.com ([209.85.160.199])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 20 Dec 2012 06:31:57 -0800
Received: by mail-gh0-f199.google.com with SMTP id r16so919924ghr.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2012 06:31:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=mAmHoPrYM5cF4T+9VhL5ZAtVEbVZuAixHJYslpNxbNk=;
	b=YZKq64L95iiR2PVuP4cZXk5X+i9Tu/V6ncmJFNRooz30gxN++UFMi0mLmfnTGXUmmH
	2uJr+DeDqsoXwUauFyoLKo9Cii8t/Ly9OiJNGtYUlCytVO5v8DecXUhzWD6ZsZhBgTVp
	uxlW4XlGYg+oHQSoLyq/dho3SXFwJUeL/I1YDsOmblnt3Lem48OpOXhlJ5A2eDu0/8ok
	c/kFipYoJTnmnQ4R7tmEtPJycSN9nWbB8F9AZ8EsR4LGo/L7p0gm+GrX3wsStl5yolho
	N2jSYgpekSIvQMphFu1iZBlFVSWmYJqrD3kP4fab1OZ6CJG5dO2N/4ym6QSh3RhWbTka
	6MTQ==
X-Received: by 10.220.157.9 with SMTP id z9mr14727368vcw.45.1356013915033;
	Thu, 20 Dec 2012 06:31:55 -0800 (PST)
Received: by 10.220.157.9 with SMTP id z9mr14727362vcw.45.1356013914908; Thu,
	20 Dec 2012 06:31:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Thu, 20 Dec 2012 06:31:33 -0800 (PST)
In-Reply-To: <CAP9ODKpt8gcfkm=59q-HGFcN12uZ+qJ5ZPJanyNCBtYj3BEc7w@mail.gmail.com>
References: <50D1F76D.4070000@intel.com>
	<EC7262B3-B95B-4AC6-AAF3-4EA4B7C66B3F@dominion.thruhere.net>
	<CAJTo0LYA9-__u-ptX+=2D61wjVEDDc=6mfdFDc_+8-9zr22s8g@mail.gmail.com>
	<CAP9ODKrrSKgd4oFc06Ea=qero4i8Lc1awT7NH_+WwbZru0+XEQ@mail.gmail.com>
	<CAJTo0La6DRoi8vfbn+qDad5Zm1fpceKfTpRZ=1e07XL79eBswA@mail.gmail.com>
	<CAP9ODKpt8gcfkm=59q-HGFcN12uZ+qJ5ZPJanyNCBtYj3BEc7w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Dec 2012 14:31:33 +0000
Message-ID: <CAJTo0LZPiEz6RcQuckppAfF0YZ9B=0pmsP+iJgNG3n0RvV1j4w@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Gm-Message-State: ALoCoQmfEDgeSYim3QaNt4+KY05kMBysB3RdgxroracOjo4P+El0wtbBKBXzdpZndL22S37O3CGa0kLcb5Gz1dma5V0tsWhbqSlJZN1FOjtx+SUTWoFRU9EA/YzElHwjHGPy3D/FgWxgnem/6RbmCZPvOmFviOUmVKXNoJthTYAApHkQZWxEx/f5PFtBMZ1y/fL9eO6jxXnj
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: systemd integration
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
X-List-Received-Date: Thu, 20 Dec 2012 14:46:45 -0000
Content-Type: text/plain; charset=UTF-8

On 20 December 2012 13:09, Otavio Salvador <otavio@ossystems.com.br> wrote:
> I think if I enable systemd feature I do expect to have some systemd
> libraries in rootfs however I may opt to use it or not. If I do want
> to have *no* systemd libraries, than I should not have systemd feature
> enabled.

What's the point of enabling systemd, having the libraries installed,
and then not using it?

I don't see what the appeal of supporting multiple init systems a
single distribution, with the downsides of doubling the test space and
wasting space in situations where you ship all the systemd libraries
but don't actually boot with systemd.

Ross


