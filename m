Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4484B60017
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 07:21:47 +0000 (UTC)
Received: by obbkm3 with SMTP id km3so22696356obb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jul 2015 00:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/vf6WsHQ06Ewg6yV4lSSTwLiFMkmB5b/3LXniAm2Fgw=;
	b=RtfE/INFiV41Ch3fzZQBm0JRlIamLU6v7vw201fsKh1mBNzY1UOKelJWFre/4Y1zY6
	mmM8OcoPozzRvlV0C6aJsJAlduPQlp5BHqCc8X/Olf7PLPWwNYbeXc1nIfbsDImnyoFv
	n3g3TjsM6zKHSKLTBj8fS3MBIq/f4vNvznfpOW4mPunQYM7nDOsaJPUwxDswf2FB2GVx
	FyKBHAr//21uXuyl4utX+XFyQVeceU9lfXRSI1cpQWKl0Nv23Esfnby3WeQgn0Uad0jO
	aGYvfzcIZ6JLZ7mv1w8vlPHZpWEVbOuTKoifFG+VlBa7OebrEoBeIWUzm8W3xylzXGkW
	rqzg==
X-Gm-Message-State: ALoCoQnKwnDQPTQVdQ6YrQg9+UbUQRgEeOWxknvBUcBnV6kgTZV7nwHjs9OKpu+reD3X9meE/5ns
X-Received: by 10.182.48.231 with SMTP id p7mr21158963obn.19.1435735307211;
	Wed, 01 Jul 2015 00:21:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.225.2 with HTTP; Wed, 1 Jul 2015 00:21:17 -0700 (PDT)
In-Reply-To: <CAJTo0LaNMDtNSrOad5=Vd6ZqJ_MCiT0oez7e-3zmn4BjWfkVpw@mail.gmail.com>
References: <cover.1434464336.git.jussi.kukkonen@intel.com>
	<f695a9f8ea4c35b040d98d2793153fba91771ec5.1434464336.git.jussi.kukkonen@intel.com>
	<CAJTo0LaNMDtNSrOad5=Vd6ZqJ_MCiT0oez7e-3zmn4BjWfkVpw@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 1 Jul 2015 10:21:17 +0300
Message-ID: <CAHiDW_GjyvdFHNt7JP=xzOxzx5RMJ7qXqrBd1_MVPL8d5Tew0w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 5/6] sato-icon-theme: Inherit Adwaita, not gnome-icon-theme
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
X-List-Received-Date: Wed, 01 Jul 2015 07:21:51 -0000
Content-Type: text/plain; charset=UTF-8

On 30 June 2015 at 18:39, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 16 June 2015 at 15:22, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
>>
>> -+Inherits=gnome
>> ++Inherits=Adwaita
>
> Doesn't this also need a RDEPENDS on adwaita-icon-theme?

So far there has not been a hard dependency on the icon theme from
anywhere, except from applications that actually need the icons. I've
not changed this basic idea in this patch set, except for setting
"RRECOMMEND adwaita-icon-theme-symbolic" in gtk+3 recipe (because GTK+
widgets expect symbolic icons to be there).

E.g. core-image-sato does not have gnome-icon-theme installed
currently (just sato-icon-theme and hicolor-icon-theme) and I think we
can still keep it that way with Adwaita.

Jussi

