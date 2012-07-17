Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrAdO-0001mT-LJ
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 18:28:28 +0200
Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 17 Jul 2012 09:16:39 -0700
Received: by wgbdr13 with SMTP id dr13so378847wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 09:16:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=GMWzFF1xHjENZUJFPrPxFN+4lIfEZvnIFXsDSFNS1nk=;
	b=LS39PAL9hvtxpqFfkiWsW+4q1bVbwOZt02GzcxZV+YGl0A9CT82Id2d39CwbXBV+Jw
	wSZoSkEB//7ldUfhgCir21lUubF1I6jwBBF7sw+/1K3gRNJl5ygidKupa2Aas0hEZBKG
	HGnCwC7vauae27tLkYg2wkiy01GDpu/xji32kDxRsRxR8F47AVNFEJE7/jphd5EVAnQH
	rigdEfxHFQwkM9b0VVNvMHwljbdCFLNnY2Je6zP+JlVg88kQS2XsuJhBfX6phZUKHMPc
	6jn2bnjUz8TlnkifNej8UwgvclG2xYW0UY6kUUvqDEB1VO+vSe32X+26AXFn+hinLePT
	IS5g==
Received: by 10.216.233.197 with SMTP id p47mr1579522weq.215.1342541797710;
	Tue, 17 Jul 2012 09:16:37 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id y5sm27689423wiw.9.2012.07.17.09.16.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 09:16:36 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2012 17:16:18 +0100
Message-Id: <1342541781-26628-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkjt40/VY9vlrl1rFbyJ4v7IwGynXa7RlEe3j02QaI21kejbqZTdkWpbHQ4rlM6Q0rryasY
Subject: (No subject)
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
X-List-Received-Date: Tue, 17 Jul 2012 16:28:28 -0000

Two patches to follow up Andrei Gherzan's connman series.  The first applies
to master, the second only applies on his branch.



