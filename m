Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U2JoY-0008Q4-GK
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 12:02:30 +0100
Received: from mail-wi0-f198.google.com ([209.85.212.198])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 04 Feb 2013 02:46:28 -0800
Received: by mail-wi0-f198.google.com with SMTP id hm6so1692621wib.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2013 02:46:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=tBySzhLFV2fVXYxObziOtVK6k7qDBt3oH3yFcQvRTo4=;
	b=eK72foM3/osLC2RUIhalihjGoOgQuzjW/snidZODQ8o251ubb/pwYOHnMKdXOi4nmu
	CFnBLJmsz5CVi6c8Z8/fM2z9D2PZb+NKCHGp95uGMgO8G0sJ8DnA9uvAkMocb+nHWOk/
	bOBFLMlemPaEIaRpsmkCvvTFOTZwIF5oFARZqQ34j2VuKXokalsDbwjxEohR5g2iqFZ8
	xN4NJFdEvSAnAMCwl7IqzrhoI5SvnrtK6ZVHKsYFZGMALKBFj5tqB4oBGvKZT2n0Abnr
	c3i5SfpEQ1CuhQJJDaAToLYZn5+JGMt6M4uYsZHrxqZTHfnWILFKjrkmMyAWajA/2Kwi
	+M/A==
X-Received: by 10.180.105.67 with SMTP id gk3mr2433534wib.31.1359974785875;
	Mon, 04 Feb 2013 02:46:25 -0800 (PST)
X-Received: by 10.180.105.67 with SMTP id gk3mr2433517wib.31.1359974785702;
	Mon, 04 Feb 2013 02:46:25 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id j9sm12586031wia.5.2013.02.04.02.46.24
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Feb 2013 02:46:24 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2013 10:44:11 +0000
Message-Id: <1359974656-21894-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQlSL6g8GdO00kDylKnooeYfYiqCFCiViFCTn9r/GDi2UTN0eq78C7StRZi3ionzza3KmBH0mZIhk+5UUpNss6rZKZZFkV0z5SBCuQj4GMd9NmFg4CdEhCjNcrPzmYOA+k0GCZ49a48V/o85JlUhWPim6N5It9b6NAM46KpZQ6kIrZjxccrLAKnVLeE9zWv40o2b1PbZ
Subject: S != B build fixes
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
X-List-Received-Date: Mon, 04 Feb 2013 11:02:37 -0000

Hi,

I'm slowly doing a build where B != S in autotools.bbclass, fixing/disabling as
I go.  Here's some more obviously correct fixes from my latest hour on it.

Ross


