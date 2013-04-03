Received: from mail-wg0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UNJ1m-0001Iv-AU
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 10:26:42 +0200
Received: by mail-wg0-f47.google.com with SMTP id y10so1307888wgg.14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2013 01:09:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:date:from:to:cc:message-id:in-reply-to:references
	:subject:x-mailer:mime-version:content-type
	:content-transfer-encoding:content-disposition:x-gm-message-state;
	bh=8qYx5Lr22KU9oZPQnHUGISc787kdQ4XGvaIrfDd7Okw=;
	b=TVl7H5JweGIVqLvj7Tg/PrGizAAJM2Ap2M0eWt3GasJ2uowUsYKlq6bTd19dRA5kZE
	/AhQEIZ9pCog9g5nM6e4HS4lhslIBsTcLqeVHKwDiBI4PpgWZNrNUpXKoz/w2itrzBE+
	J/lSlhFXeOqwohKbgm+PE71b3FFwEc2EvQs8uZf8gMMdnbHx4CK1ZcMBdylhpNOV5JIH
	DWf+u0hqK0eJUAxHCRVMKirau1FeRu3VjLD7QJvFjWgWb61/dtdkfMjiNRXoAgHvWXn+
	Q5iGSriDTSenJSckeHVwM4oSy9U6N48u384P+RRRKBrczXblRuWjrARztyA3z2xeWiSU
	jItA==
X-Received: by 10.180.11.148 with SMTP id q20mr2945099wib.18.1364976571365;
	Wed, 03 Apr 2013 01:09:31 -0700 (PDT)
Received: from [192.168.1.11] (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id s2sm7318941wib.4.2013.04.03.01.09.29
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 03 Apr 2013 01:09:30 -0700 (PDT)
Date: Wed, 3 Apr 2013 09:09:47 +0100
From: Ross Burton <ross.burton@intel.com>
To: Darren Hart <dvhart@linux.intel.com>
Message-ID: <D8E6D6E1514B4B1297F02DD04278253F@intel.com>
In-Reply-To: <cover.1364942359.git.dvhart@linux.intel.com>
References: <cover.1364942359.git.dvhart@linux.intel.com>
X-Mailer: sparrow 1.6.4 (build 1178)
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQma7Ot3FiImb4Em/aImwB6ibe/s4Ujn0Ike9lTX1vKf4ZwaKNydo1F9cXfGjSfxx3afkEGg
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] Add input group and udev rule to fix rootless X
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
X-List-Received-Date: Wed, 03 Apr 2013 08:26:42 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday, 2 April 2013 at 23:42, Darren Hart wrote:
> udev: Add rule adding input devices to input group

Please put this in udev-extraconf so that systemd's udev can use it too.

Ross 




