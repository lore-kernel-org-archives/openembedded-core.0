Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id B7E2D73190
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 17:04:14 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id s2so15407266iod.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 10:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Y/JboeuPQDzqQCIHq+ysHnlvLN419Tc5kbytdwewl6I=;
	b=tj2AkhWxdpZIiaowKNMGfp1xEQPV1Ky3VSw9SYOnQRpjm3XeAxxH12ILYOJ1if+IZX
	LRK/B+NOAuBi8ZVFAkYawhuwK4mKBl0+T1cN8MEnJiTW5nmFXLFpc3zHp2WSPxqyeAPt
	Uh1uoBvgdjfTWcCCDqbS2ydGpPPYAajvKL+B/UyQS7H+7+PrPxs5g7tqtp/EqjN1MgZ2
	FD5sobAuObEvomt6gbo3nftWyigaNZyC8zdC48bqthPgk1ryeysFblNYsmKcOFWwEpcK
	B7hHmDc79EmtEsX5eyzdkzVh+2auoUH228c7K2tgelDEFJoxoUDHGUPB6Zv0uIkk0dji
	MJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Y/JboeuPQDzqQCIHq+ysHnlvLN419Tc5kbytdwewl6I=;
	b=L3WCeuy/zUHJwLRB8QSZhcu+cHsdeC8L9ERnVZNMGl2tYCF7Z8ajHB7QHSY8Hn3vr/
	8DhGxT/baLQTfRKjH78HlbMZgRWmGs0CCEaSZGvDuIvRxG7oCN4OgDLaucLKiflxoVzY
	SQiXxLCmxmDH1IC2X3klEBumOCYZ/jkl6RJR6XhQfUhweBnFuBbonjUiWu3j0TFtbAba
	bzsWcl/7OWk7uUm5JZcuTrl0zEZghYkWu6Zvoe2hGNPg/+qltSayDcTcCLcjvAy6+oKt
	HXPzMo3X5kV94ANeL2S0Ow0WKIkdvb7mMaJJj2JGfrw7JCSNmUvEKd9A2fVgnw3AQXLx
	93Mg==
X-Gm-Message-State: AOPr4FUXGm/Qrn0r5RJ1A/pgx16hW5L/NEKhSifMjZZsC/yi+mY29odd0kh4+9uDNy3C/A==
X-Received: by 10.107.138.224 with SMTP id c93mr18979679ioj.143.1461344654768; 
	Fri, 22 Apr 2016 10:04:14 -0700 (PDT)
Received: from linux-yxv0 (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id au6sm4430588igc.0.2016.04.22.10.04.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Apr 2016 10:04:14 -0700 (PDT)
Date: Fri, 22 Apr 2016 13:04:10 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: "Jolley, Stephen K" <stephen.k.jolley@intel.com>
Message-ID: <20160422170410.GB23308@linux-yxv0>
References: <9ADD3FDE8B189B4AA2F8A3C711F8155E570F86EE@fmsmsx111.amr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <9ADD3FDE8B189B4AA2F8A3C711F8155E570F86EE@fmsmsx111.amr.corp.intel.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Yocto Project Status WW17
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
X-List-Received-Date: Fri, 22 Apr 2016 17:04:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri 2016-04-22 @ 03:13:21 PM, Jolley, Stephen K wrote:
> o   Encourage adoption of new tools (toaster, eSDK, CROPS)

Have the eSDK and CROPS projects been announced publicly? Are they available
for us to "play with"?

