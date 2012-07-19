Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrvwZ-0005qN-Cm
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 20:59:23 +0200
Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 19 Jul 2012 11:47:59 -0700
Received: by wibhr14 with SMTP id hr14so2388311wib.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 11:47:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=SLz4vNxjMpQOD52gULnaA8GbG5SmngWby3E1xYd8EKk=;
	b=L60/DD0pYSumRO3XEfFsIUMsaXGGkiJ2HQqg7saKKKACQAV3/QwzMaMNn+QDhHL6Px
	PTDXnz9fOBtt6kAHDrT6GwKN+PD8qjb+ls1Mg682fRM0zK5SLFo+K405lrMlJ2WhsqEZ
	2SLAIDwWTS19j+TDLOiolMfps7cT6kxGJegC9qbEioKtc2o5FU5xVKrtkzgFlkHguMSs
	y7NVTaPLpqcqobqCblgLzntxvvuVoRD9ZCp801aJmcpVYja+QXQPaTaHfEnOgnwEtLA8
	JhYkWZ8a83CsgzZj7tHWFx3ooiE+KkLJCgqaYRiGeVwjpYmXguoxqX3ADNoiVj0UZzwp
	5Lgw==
Received: by 10.216.142.167 with SMTP id i39mr1712394wej.94.1342723678080;
	Thu, 19 Jul 2012 11:47:58 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fu8sm39860875wib.5.2012.07.19.11.47.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 11:47:57 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 19:47:33 +0100
Message-Id: <1342723654-9443-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1342716212.21788.3.camel@ted>
References: <1342716212.21788.3.camel@ted>
X-Gm-Message-State: ALoCoQkDLu8Wi9vKzhNTE1soh1LBYGe2r5fDhuVOD9JXr+FOqsC8o0jyBFFm5AteYj2mypJWa4lx
Subject: Re: [PATCH 02/26] change gtk-doc.bbclass to pull in depends and oeconf
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
X-List-Received-Date: Thu, 19 Jul 2012 18:59:23 -0000

(attempting manual git send-email mojo to avoid sending another huge thread. Sorry if this goes terribly wrong!)

Revised patch attached. I've rebased the ross/gtkdoc branch with this commit.

Ross



