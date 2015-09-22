Return-Path: <marcus.mueller@ettus.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id 930867391A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 18:45:28 +0000 (UTC)
Received: by oibi136 with SMTP id i136so10939743oib.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 11:45:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=Yx+6A8jkfvBEIiV+E/m3WZPHF0VZc12U2t7LehLWcEA=;
	b=J3VOH/Mnyql5m27PTlrG/EC29i0YjPPomyRV2jubyHxe071yOYkC/IPui/u4XN0zyn
	VXXSK3EPJc0Qoviz4oLNUIvVs+BAggSD+yagCYiBPW3W+xONhuPNwfTtIcvZ0xXTnui2
	N3iMlLK6z67G01AHHvVe6pKMgbyEw5Ax+NGuPumtJL7+kEQm/Yut0175DEnciRA4Wx60
	4E21kxvRopwg4m0AR0abavd4+5UvtUQNy/tjUV1cFaStQVrXCXO/U3eUrU3INyNTaBJZ
	ynqxDKfQb6Bo6vfBOAoEiFVFz/ay9igLXA5jYHeomZPMiWltl4NiYStr3ep3VKMdW00O
	c7rg==
X-Gm-Message-State: ALoCoQnhdSR4LQtCba0v2UOip2msLkoMP+ugc/SCEOI/zOAjUW5psM2Fpa1ETssAkUMoQMVSQHxz
X-Received: by 10.202.217.194 with SMTP id q185mr7767859oig.29.1442947529017; 
	Tue, 22 Sep 2015 11:45:29 -0700 (PDT)
Received: from [192.168.128.8] (x5f71d3b0.dyn.telefonica.de. [95.113.211.176])
	by smtp.googlemail.com with ESMTPSA id
	188sm1443820oie.5.2015.09.22.11.45.28
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Sep 2015 11:45:28 -0700 (PDT)
To: Lee Nipper <lee.nipper@linux.com>
References: <1442943875-2955-1-git-send-email-marcus.mueller@ettus.com>
	<CALg11mgdLnVNq745Z6vzP5R2t=dcpamHTKkg5ptv5+NXWFxXpQ@mail.gmail.com>
From: =?UTF-8?Q?Marcus_M=c3=bcller?= <marcus.mueller@ettus.com>
Message-ID: <5601A1C6.5050205@ettus.com>
Date: Tue, 22 Sep 2015 20:45:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CALg11mgdLnVNq745Z6vzP5R2t=dcpamHTKkg5ptv5+NXWFxXpQ@mail.gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] hand the TEMPLATECONF local over to setup-builddir
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
X-List-Received-Date: Tue, 22 Sep 2015 18:45:30 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hello,
> If I understand correctly it allows a user prepared $TEMPLATECONF
> directory
> to be used by oe-setup-builddir.
Indeed; the point is that oe-setup-builddir was definitely meant to be
used with a TEMPLATECONF set by the user; in bash, the TEMPLATECONF
local variable is automatically passed on from oe-init-build-env to
oe-setup-builddir¹, but in zsh, this doesn't work without explicitely
declaring that should happen (which is the only thing my patch does).

Best regards,
Marcus

¹ not quite sure how; it's a local to the calling script and shouldn't
be a local or env variable to the callee, IMHO.

