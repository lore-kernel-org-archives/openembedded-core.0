Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 218F27027F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 05:44:25 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id vb8so403558obc.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jul 2014 22:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=QFXywYi5JLCjoS/qcaVVTi0mkWp92WOOD+tWZtkbgx8=;
	b=Xc0rZOE1ZtV4zGAPnMkPpTX8mxbLLrOM2It3xWM9B1UtxJJm1YJP5ZnVCPqCj2AtbJ
	pUdYQ8hHBnjTV+IM/pRUouhuHEMiCZSY5ufexqQrjePHM1dV1zXQwhP0sUvlYAfje8Zx
	6d/mskmvyIZxJFrPF+w9PNBuGidw/UV5Vmd+d7vEPxDIgfPDx5vikqdbkhGZBCgCQf6h
	Zcdr/hmNKQOS255PlsSfBPdppZDqAPH84Fz0WTWUkK397yqT8/8vysaLhbQDiF0ADAxH
	zBc5jZmR297WdGULzPz4DbQ/tVRRDGAgj9pFZmtqqic+1985ss1kVkRwtGkkB8zHtR65
	wRdw==
X-Gm-Message-State: ALoCoQnDdqkApAVphidliSFJuWyhXITx3laBQoWe3qMHhuuBZSU3e5lxSFgdwF2vvI29Vr+tOk0D
X-Received: by 10.182.96.166 with SMTP id dt6mr58942106obb.7.1405057465877;
	Thu, 10 Jul 2014 22:44:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.171.168 with HTTP; Thu, 10 Jul 2014 22:44:05 -0700 (PDT)
In-Reply-To: <CAJTo0LagVOxUCNT1P+=6yBXydb0tP6SuADyy6CAb4jgX=YU1Eg@mail.gmail.com>
References: <1405013524-11228-1-git-send-email-nicolas.dechesne@linaro.org>
	<CAJTo0LagVOxUCNT1P+=6yBXydb0tP6SuADyy6CAb4jgX=YU1Eg@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 11 Jul 2014 07:44:05 +0200
Message-ID: <CAP71Wjz4jFWKV=HQ49_4REiEdLyaysCH=P-xQEpgBObSSoxNoQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] git: update to v2.0.1
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
X-List-Received-Date: Fri, 11 Jul 2014 05:44:30 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 10, 2014 at 9:37 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 10 July 2014 18:32, Nicolas Dechesne <nicolas.dechesne@linaro.org> wrote:
>> Also fetch source code from kernel.org. As per the Git release announcement, see
>> [1], Git source tarball are now located back on kernel.org, at [2].
>
> Were there any big changes in 2.0 that we should be aware of, or was
> that just an arbitrary version bump?

I think the most notable change is about git push when no branch is
specified. the default changed from 'matching' to 'simple'. it should
not come as a surprise since it's been announced for some time now.
and in fact it is a much better default anyways..  other than that,
it's just business/improvements as usual. see
http://blogs.atlassian.com/2014/06/happened-git-2-0-full-goodies/

