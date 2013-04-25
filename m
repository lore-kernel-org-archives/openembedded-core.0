Received: from mail-ve0-f180.google.com ([209.85.128.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UVJeh-000688-P4
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 12:44:03 +0200
Received: by mail-ve0-f180.google.com with SMTP id pb11so1200030veb.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2013 03:26:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=UewS0B4kx0d2xKM/1jGmf5pEhylMqYiAydH2fDEcMq0=;
	b=FpamhSR22lryP6mg6l4T5OBLRLGMsAWuLNi0YjEtwcYDW9zKXjOa0E7bVoctqfMDSZ
	vxidM8E4Xc1kCQmc3D3GMIi9dmd5R4EejaPepSMZ6KuczlHSfCl82nqKYXHyfTdbS7T0
	RyzfJ1mdtXDTSAJYtYQWX98GxZidAp7I/hJ9JMX1E4rJ8/gANhd8n4YxQnbk9WPx5pbr
	lh3wlCLbnbJbYumnO9UFyatWfpPk8BqFMT2Mssa3W0FUYij7dPuhTL8xCRG5FyNnmdpC
	Qyv+JbS3q1IiPs1cYjEHxTOo5E9Yh8JVomITq7XfMjq77Izj9h4/eAx+LLtq008wNUcV
	rAgQ==
X-Received: by 10.58.15.193 with SMTP id z1mr26965427vec.40.1366885576144;
	Thu, 25 Apr 2013 03:26:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Thu, 25 Apr 2013 03:25:56 -0700 (PDT)
In-Reply-To: <1366885254-26519-1-git-send-email-koen@dominion.thruhere.net>
References: <1366885254-26519-1-git-send-email-koen@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Apr 2013 11:25:56 +0100
Message-ID: <CAJTo0LZLc-ZJz=b5GW9OFB7dg-9v+6_wh00tLWV9xhN2PSmHxg@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnMRiJDXm0d+MDgbok5vuIsYEKVdofNk1J1w1sbdS7UpsZeqEI1v8+tp0yNC5eXHto1r5Sb
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] gst-plugins-gl: make it work for both openGL and openGL ESv2
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
X-List-Received-Date: Thu, 25 Apr 2013 10:44:04 -0000
Content-Type: text/plain; charset=UTF-8

On 25 April 2013 11:20, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Those are mutually exclusive, but PACKAGECONFIG doesn't seem to handle that yet, so use this slightly ugly construct.

Ugly construct but what else can we do apart from ask upstream.

Signed-off-by: Ross Burton <ross.burton@intel.com>

Ross


