Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TvNsf-00052A-DQ
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 08:57:54 +0100
Received: from mail-bk0-f69.google.com ([209.85.214.69])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 15 Jan 2013 23:41:25 -0800
Received: by mail-bk0-f69.google.com with SMTP id jg9so1183759bkc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2013 23:42:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:date:from:to:cc:message-id:in-reply-to
	:references:subject:x-mailer:mime-version:content-type
	:content-transfer-encoding:content-disposition:x-gm-message-state;
	bh=uIXncXMcaOy47jBwyIdeBjCW9LEq6koZY1sH4PaFt3o=;
	b=XNVsoq8QMFMXVn6n1SjQEWL07Zn0yrj7TfeisDYmPlRFHWmN4i/SCzktAUNTWeLfJ+
	mc0c3CbVmPurjuPuestUrk9LxW4ZthLgls6UPGqHZXkwbpGLUYsXwDKqL9MIQJfpsGTw
	n370G+4SfnOP8wIqQSkEiZPKmUDNFeFcxHUCJdZDjRCjXGqouzMhSDODpOjGJcv2Hex7
	ATQyoVw1rJku0GuA8DMxNPOBITrIfkPzD6ucepAPQjF/jtIfzBKaU9QRSdB4MAR2GJPB
	v9+MU0mCv9lHly8ah5/l/PKUyFGPYPzCbOw5+z4+pVlm5OJAKn1e3L253+qcowcHVXlP
	q5Uw==
X-Received: by 10.180.106.34 with SMTP id gr2mr296306wib.18.1358322148805;
	Tue, 15 Jan 2013 23:42:28 -0800 (PST)
X-Received: by 10.180.106.34 with SMTP id gr2mr296294wib.18.1358322148629;
	Tue, 15 Jan 2013 23:42:28 -0800 (PST)
Received: from [192.168.1.7] (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id e6sm7727445wiz.1.2013.01.15.23.42.27
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 15 Jan 2013 23:42:27 -0800 (PST)
Date: Wed, 16 Jan 2013 07:42:35 +0000
From: Ross Burton <ross.burton@intel.com>
To: Cristian Iorga <cristian.iorga@intel.com>
Message-ID: <A4A34200E35C4007BAEAFC1D08F1D399@intel.com>
In-Reply-To: <1358280527-14078-1-git-send-email-cristian.iorga@intel.com>
References: <1358280527-14078-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: sparrow 1.6.4 (build 1178)
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQmS2Ngv2e93f1tWja8UY/t6gx36CNPe9JOGG7kF4AINDR1Bb0JqlgmI9sYmi5OaS5XYR1OKWuNVlZ4udRq2Dq1wmYAd6oeM1M1lDqGd4PGtf/lnyBRb13v/+660dreaP5vnRh1UEpbm5f30XhIrL4UZVrNBnkxGxlEyLlCa6brx05X3yeOKjiPixk1SKmXbS4oNJXna
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V4 0/3] connman 1.10 upgrade and qemu networking fix
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
X-List-Received-Date: Wed, 16 Jan 2013 07:58:19 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday, 15 January 2013 at 20:08, Cristian Iorga wrote:
> Cristian Iorga (3):
> connman: upgrade to 1.10
> connman-conf: configures connman in qemu machines
> qemu: machine override ability added

The ordering is wrong, the qemu change needs to land before connman-conf, but assuming that Saul re-orders these when pulling Acked-by: Ross Burton <ross.burton@intel.com>.

Ross 




