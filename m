Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2A72C70149
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Apr 2016 12:56:25 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id e201so15474262wme.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Apr 2016 05:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=user-agent:in-reply-to:references:mime-version
	:content-transfer-encoding:subject:from:date:to:message-id;
	bh=PwP88nb6Kz+XupzWDC9vMY6yv1kJNTyzNSFgjv4Gvso=;
	b=GPutJp2QbOqK6jzMH8RFdZKZASWK4uVIE0yJEqvz3okzSyjD+80Rfk14OVNveyGgw9
	Y17f7yJUrmJjGy6WTSUt9OVLDrCJjXpBfbS2084bFPWncx9HIDhzK4X+97jSx8ncliM2
	9zWfWq5sn93rxQSJkq/kECi/JmrcDvS/B37+GoxmE+Ratoi9asfOkGS48jmsGwEcD0sF
	6pX21y5PnfUJajKcPNPZnqdluf3ZIOhjY99b43pMl1qNj5/gTcclIlcuzKogGcj2IcVK
	oyb+V7A9wiFmPDSbjiAegBf86iaxydoMrIBPFggn41u5tl0IEkWxEjydeq/E4ymeubAJ
	p7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:user-agent:in-reply-to:references:mime-version
	:content-transfer-encoding:subject:from:date:to:message-id;
	bh=PwP88nb6Kz+XupzWDC9vMY6yv1kJNTyzNSFgjv4Gvso=;
	b=hs3YTFiY8Wbs7UfyTEuFSwq9htbSUW6THcCe+yTJRbg9893r4KeMDUnHWnhVTD5tok
	Iz6vy8coz/OrqFagHnZscFe2J8/Rtgq2MIrE6h4gYFiFPD0lFnotqhZr2x6EOLdt5jqr
	V8f0TW1wZnIHfoXvOpLaxrik7qe2xM/tB0m50vScWJfpvfZt6D+ngeP6vTa8FAHH6JPm
	mw4OqUTHp1NZnsctVJ94JxdZa3eb4ugLO/TN3Ffk7PjRyI44h1fYcPvFG9heTk4T8QKW
	rxRw9zQhTEdRkX3Lv4Zf/dBRpgaUad+liyahpylJrTcawzoWJV//qKFr0IdbgqszGj/a
	Qajg==
X-Gm-Message-State: AOPr4FXePK8yKpl67JdaO+INg6mIUiyhn+XQpvfppM356H4/Pzir5eDYdguJCVk3Nq7mkQ==
X-Received: by 10.194.117.70 with SMTP id kc6mr32628676wjb.94.1461502586041;
	Sun, 24 Apr 2016 05:56:26 -0700 (PDT)
Received: from [10.61.89.54] (089144227054.atnat0036.highway.a1.net.
	[89.144.227.54]) by smtp.gmail.com with ESMTPSA id
	r75sm12929625wme.18.2016.04.24.05.56.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 24 Apr 2016 05:56:25 -0700 (PDT)
User-Agent: K-9 Mail for Android
In-Reply-To: <57193029.7010209@iot.bzh>
References: <1461160239-7799-1-git-send-email-yannick.gicquel@iot.bzh>
	<1461160239-7799-2-git-send-email-yannick.gicquel@iot.bzh>
	<5718DE65.1070402@opendreambox.org> <57193029.7010209@iot.bzh>
MIME-Version: 1.0
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Sun, 24 Apr 2016 14:56:06 +0200
To: yannick.gicquel@iot.bzh,openembedded-core@lists.openembedded.org
Message-ID: <23696FBA-99EA-4563-BBFF-1BB57E9DEAC2@gmail.com>
Subject: Re: [RFC][PATCH v2 1/4] u-boot: basic support of dtb append for verified boot
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
X-List-Received-Date: Sun, 24 Apr 2016 12:56:26 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8

On April 21, 2016 9:55:21 PM GMT+02:00, Yannick GICQUEL <yannick.gicquel@iot.bzh> wrote:

>>> +do_install_prepend_pn-u-boot () {
>>> +	# Concatenate U-Boot w/o DTB & DTB with public key
>>> +	# (cf. kernel-fitimage.bbclass for more details)
>>> +	cd ${DEPLOYDIR}
>>> +	if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ]; then
>>> +		if [ -e "${UBOOT_NODTB_IMAGE}" -a -e "${UBOOT_DTB_IMAGE}" ]; then
>>> +			cat ${UBOOT_NODTB_IMAGE} ${UBOOT_DTB_IMAGE} > ${UBOOT_IMAGE}
>>> +			cat ${UBOOT_NODTB_IMAGE} ${UBOOT_DTB_IMAGE} >
>${B}/${UBOOT_BINARY}


+			cat ${UBOOT_NODTB_IMAGE} ${UBOOT_DTB_IMAGE} | tee ${B}/${UBOOT_BINARY} > ${UBOOT_IMAGE}

thanks,

>>> +		else
>>> +			bbwarn "Failure while adding public key to u-boot binary.
>Verified boot won't be available."
>>> +		fi
>>> +	fi
>>> +}
>>> +



