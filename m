Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f53.google.com (mail-vb0-f53.google.com
	[209.85.212.53])
	by mail.openembedded.org (Postfix) with ESMTP id 207F1612D1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 15:14:45 +0000 (UTC)
Received: by mail-vb0-f53.google.com with SMTP id p12so4629168vbe.26
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2013 08:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=AhVuv/ng8HSAU0COdTPDV2QGUplJ7n2B/HQEhoN6M2k=;
	b=MzPR/Be9ZVy3okmfjmPw5F27xkWfwPDhedAitmvzyTdL3/s5Wp12xNB4idK9lxzgB7
	HTN034TCz6RdQo9aIXnYVKgXtinPrlhTepGlaARD+l0nHiNLfRGDIswwYyeymwsHmrtk
	cWRbM4QdWFRjd+fFSD0HBWUViW77H8Rt1gJkXpGihWFU+mt77lCDGCamKLzH34ZDVRwv
	wIZDIdZO/9ddXkB/OrDlDssvQIdcBV12Bcrf68JcJ6LA4PhN9qqu1NxP+XRFZJP6dNNu
	VqpG8Y4Z0ASy+FCXhUREdwprciuPrd94Td9mAhaVh7XC3Dmu5JBxfitwS+gNYK0i8eyX
	CpXQ==
X-Received: by 10.220.73.66 with SMTP id p2mr11396378vcj.94.1372778085481;
	Tue, 02 Jul 2013 08:14:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Tue, 2 Jul 2013 08:14:25 -0700 (PDT)
In-Reply-To: <1372769121-3111-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
References: <1372769121-3111-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Jul 2013 16:14:25 +0100
Message-ID: <CAJTo0La4UFeV2Ew0rs5Jw2AQog7-JJuaG4QZNBeW4yBxXN27yg@mail.gmail.com>
To: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
X-Gm-Message-State: ALoCoQn6+PO3ME5NjoMHZQYM+FeSiy7SSU1bxReqwNpzIZzfPRA38LdvUow/t2dpORjdHJxWDZ83
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mkelfimage: switch to git repository
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
X-List-Received-Date: Tue, 02 Jul 2013 15:14:45 -0000
Content-Type: text/plain; charset=UTF-8

On 2 July 2013 13:45, Emilia Ciobanu
<emilia.maria.silvia.ciobanu@intel.com> wrote:
> Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>

Can you explain why you're switching to git (unreleased features you
need, I presume?) in the commit message please.

Ross

