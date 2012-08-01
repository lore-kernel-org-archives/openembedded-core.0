Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwZMi-0006km-WF
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 15:53:33 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 01 Aug 2012 06:41:53 -0700
Received: by obbuo19 with SMTP id uo19so10498168obb.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 06:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=tcbAYUkx7tfwI58CYwBwZBcB4F05yel0xr+m7rI0MJo=;
	b=b3R9Xa08ZC3hkTfmCe7fIQTrp2gTqfAuwbBBRlP+B48cqhZgF6ITvtogYZ/U7Dmfb+
	hK6nH22vbO8Ck8JzOk+LaE2CWS8Nw9Asg10N9TxwZiuoueUUny+ATBju52tuJR3q2rfD
	CyLIDq0oYkKz89X3hSmol5UGloAODjESvgXkKmwtmJ7BGfv1XOOCq2gV0z4Y7s4LBLo5
	1q2QVOyydWh6zAs7Nv1hXsEVsvNq5o5g0GCHZg2USGMS/ybpuNbNVe7MmEToV6+ZsckH
	3twBV8E/elm6ZqJoehKMD/bG44bWBJoC9zPbVrLpDv0peyE5Sb/Z3bsdw8PMTon2Hbau
	0Ddg==
Received: by 10.182.131.73 with SMTP id ok9mr28993117obb.19.1343828512675;
	Wed, 01 Aug 2012 06:41:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.43.99 with HTTP; Wed, 1 Aug 2012 06:41:32 -0700 (PDT)
In-Reply-To: <40FAF05B-A7A4-45DF-8BA7-872A97FDF157@dominion.thruhere.net>
References: <cover.1343823907.git.ross.burton@intel.com>
	<40FAF05B-A7A4-45DF-8BA7-872A97FDF157@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 1 Aug 2012 14:41:32 +0100
Message-ID: <CAJTo0LbVvVqDSPpUs36JTROeq6fWendJwaVQDataN_nD6O=+Ew@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQl5xgVlI9WS8i28B421OcRATG8EkXusGNoki0zzzpWvRIC/+TPh/AIw6Z3qiSBdH2BoqGFT
Subject: Re: [PATCH 00/12] Mesa upgrade/improvements
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Aug 2012 13:53:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 1 August 2012 14:32, Koen Kooi <koen@dominion.thruhere.net> wrote:
> That will sadly break all the powervr based evil binaries (e.g. all corte=
x arm chips from TI) since there will be 2 providers of those libs. I looke=
d at this a few years ago (when mesa gained libegl) and I couldn't come up =
with a  solution other than "don't build it" :( That solution also breaks a=
 number of usecases but back then I had the liberty to not care about those=
.
> Does anyone have suggestions on how to handle this?

Rename the mesa ones to libegl-mesa (etc), and encourage TI to use libegl-t=
i?

Ross


