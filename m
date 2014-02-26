Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 296FB6028A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 10:59:03 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id uz6so594298obc.27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 02:59:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ytdvvDmJAtoxz5lF2HRqNbd7vbXqoZr3mItXj9noRB4=;
	b=k0eiw0gqezIlhgI32oAkfreBWP4N46vHsjdN7PTbsBBPFSlYE4nvgFHweXQ/fgho10
	0hHeEO0Vve6wKr0r8NMlBxJ46pTN+Z0jiuNU+HaTE7Z3Xg/nUxxpoco1TOqj46UOvZGl
	C8XOpJ+naS4Ue3hPwPsqqD8jjJZsgyGUUN0zkU+yT/i2uUPckPVYKG+ZU5ouWRdpRKuQ
	K0bMgna0KRxY93sAXV9KyxZJddoNY+DpKEMsH4Z7Sshs38Sd+H+PuXwng/t8M7HhWQ5Y
	Ge10AAqWbLb5slB0D3mR5b2DHKtUJIAXZ0jkH/BU5FaYGXCn4JXsaMrK1pe+GqYgwJsD
	2cIg==
X-Gm-Message-State: ALoCoQmwPph2zc1H/bD9wsT+8Nahv5qtFtVbxO+TGCmP1gmO+cOnT0BM1M4Tpd+lf1GuL5FDnGdC
X-Received: by 10.60.161.81 with SMTP id xq17mr6077731oeb.3.1393412343943;
	Wed, 26 Feb 2014 02:59:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.182.99 with HTTP; Wed, 26 Feb 2014 02:58:43 -0800 (PST)
In-Reply-To: <CAP71Wjy0qRY1=xx4L7q-3TgR6f6oNdzVCk1vXm=46rwXPnUXAg@mail.gmail.com>
References: <1393253881.31769.6.camel@ted> <20140224152753.GG26981@jama>
	<CAJTo0LYBuZv5NDyM1gsQEL5KQfOvMsRpvOn5kjFaYBi5XL8wCw@mail.gmail.com>
	<20140224160954.GI26981@jama>
	<CAP71Wjxz0e7qzU4tVZ3XEpF1oZtCErqjD4pPnETVJLnoecq3QQ@mail.gmail.com>
	<CAJTo0LY=TinUmQ+=d0_3oc97OwZNpw4yghfvbztyVF3EcJuteQ@mail.gmail.com>
	<CAP71Wjy0qRY1=xx4L7q-3TgR6f6oNdzVCk1vXm=46rwXPnUXAg@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 26 Feb 2014 11:58:43 +0100
Message-ID: <CAP71WjxjzbX2X+3s0YN+jv1QTEjZJaLOFvSzk83GX4tSXkLGZw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Separate build dir for autotools
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
X-List-Received-Date: Wed, 26 Feb 2014 10:59:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

Ross,

On Tue, Feb 25, 2014 at 11:10 PM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> oops. you're right. it's fixed in both dora and master. in fact i got
> hit by that on dylan... but they i switched to dora anyways... so this
> one is fine.

I guess i spoke too quickly... i just retried a dora and master after
cleansstate on mesa, and master seems to build fine, but dora failed
to build. see

https://bugzilla.yoctoproject.org/show_bug.cgi?id=5882

