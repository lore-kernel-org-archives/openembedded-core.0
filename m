Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TigbT-00045q-19
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 08:19:39 +0100
Received: from mail-ob0-f197.google.com ([209.85.214.197])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 11 Dec 2012 23:05:04 -0800
Received: by mail-ob0-f197.google.com with SMTP id v19so1828116obq.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2012 23:05:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=fkWc8LjTS22eGS6IPn/N0VUTBPHgdCB58uA27Y5cSRE=;
	b=Qg0oeXB3DpABUT8osVSv8lACq44ekhR6KUC2eK4GSdJeblVzwhE9CMRGvFeRCAD+A6
	ZM8/cI1Iy9hEBYMfDt8+PMZvYmXsAaU2v/uZx44lbhfnjZKtrFUqe77zcUXLd2AyJ9GF
	T4SHpprI2cP54H0yvppBaaom94oytR4X9AZstvj4hc8XaSZF9XCcQV4+2ezsa0reGUEZ
	nzX+yHG9I46zHTODjOK32KRNT2XqyafhQbe211kUKRwfrJ+3jUZDwlRGAzDddKD8lfGo
	plkKE2JuE6zONcQ0fuEfgaXypX1grAAXg6jXzscjFEros7sG6zsYOAf5qB6TYqBWEZRb
	QGTA==
Received: by 10.182.212.99 with SMTP id nj3mr2127obc.11.1355295903324;
	Tue, 11 Dec 2012 23:05:03 -0800 (PST)
Received: by 10.182.212.99 with SMTP id nj3mr2122obc.11.1355295903205; Tue, 11
	Dec 2012 23:05:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Tue, 11 Dec 2012 23:04:43 -0800 (PST)
In-Reply-To: <50C806D7.4030606@linux.intel.com>
References: <1355262869-4600-1-git-send-email-ross.burton@intel.com>
	<50C806D7.4030606@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Dec 2012 07:04:43 +0000
Message-ID: <CAJTo0LZtA3kn01UtQk-H-BWfqyAcXhAWrP=L3LCBqENfpamJhA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQmpCLQJxq+tTh5AW/iXutOM+3fAXw92wrwXY3em9cjbULrAyto7CcZXseWiLoEtEwVmN78Q58G+IHgrAkdeanXi6Y0IOjUthb8T5FBmhi40ArKkVzgnPyTAaZVe/+d84xnhqi0qM7gOsWSDgzUUh/49gRpnTk/Tr3ucCMu5jm0j4j+jPJDUBi3l39t88U4ywgIRZNe9
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libmatchbox: upgrade to 1.10, drop git
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
X-List-Received-Date: Wed, 12 Dec 2012 07:19:39 -0000
Content-Type: text/plain; charset=UTF-8

On 12 December 2012 04:23, Saul Wold <sgw@linux.intel.com> wrote:
>> | matchbox-keyboard-image.c:68:8: error: dereferencing pointer to
>> incomplete type

This is due to libpng15, not libmatchbox.  I'll get a fix using the
libmatchbox patch as a model.

Ross


