Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrVAj-0005pz-DI
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 16:24:13 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 18 Jul 2012 07:12:51 -0700
Received: by weyt11 with SMTP id t11so901381wey.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 07:12:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=OhMykHXxaUWnkbw+2j+GQ3t3/2ojhyLXdORsOzS8d3A=;
	b=lvmEEUGSY9+ZgN0VhQgVk5idJoNAOj2fnaKZ+fcCTwV7fEKPs+GD0hHh29ChtksyDP
	G2n3Bqt7DFoFy07Z53bOpCSiChu29o6jVqHUWxyNjiRpY0rp/vWuhLTAikLHxZclajg8
	9AEN+OBq1qUs/aI7fTqqUo+0QbRyPDYRnF8ZCBvDzAJ80u1bZcZd1xVTJbwv38qaJpN5
	ycPtu+aOowBJAg/fzWi7dJuNXi3zgAxCvvsRHIgKcPAg/+f0MSG263vQiMVhoBW+o/I8
	YqbXgPlugAz2bf18VNZBI4hzGBik2Jo/UErebiJuzrPo585PBBXOmUOeIxySPBJBRh5k
	FaqQ==
Received: by 10.216.237.149 with SMTP id y21mr677568weq.102.1342620769517;
	Wed, 18 Jul 2012 07:12:49 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id y5sm32763984wiw.9.2012.07.18.07.12.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jul 2012 07:12:48 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jul 2012 15:12:29 +0100
Message-Id: <1342620750-2552-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkORTwCJ8EIEw8u9YuXhl72xYs6pSyRf6X2/VeKkTd1oJxPpG2zC0GUZQCKWeWoTIPlbGip
Subject: [PATCH V2] sanity: display the parsed PATH/BBPATH when complaining
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
X-List-Received-Date: Wed, 18 Jul 2012 14:24:13 -0000

In-Reply-To: 

As pointed out by Martin, do the same for BBPATH.

Ross


