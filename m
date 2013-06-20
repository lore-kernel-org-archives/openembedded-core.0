Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 293E2609B9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 16:41:52 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id p58so5701694wes.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 09:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=HomTnI8tibll6Nk38MfRAW1T1kWkBFoEnPLRoT022P0=;
	b=FhDAqYI0bzdCHIP4xO+PojxSxzOHt6mzlDgND9dezXMaSgkhYxUsJTim7+c7HTMGi0
	WfLXWTwOcdIegcNVzdLA6ilRc42vVAUi+/h82M9mJCC6w51R9agQD22PM7soSBvr0IUB
	vsxQGbx+nrVav20nKnr3s2q1xUXMyyud/y3Id+2k1NNTCISnFD0dIzbwCW3D+hW952sk
	sqhN04zY5xYZ0Ls4Ui3inQd3/nYu3W++1Y76INjXTFy5ZqiQemyBLahHBfPVHrfHXOsB
	8xl7uiyCjvYXqOPEcpU320RzGrvTI6IcxA7zwDAipJKwxZZMsEaEDKqHLDSziSr21HXS
	h+vw==
X-Received: by 10.195.12.202 with SMTP id es10mr6386271wjd.17.1371746512786;
	Thu, 20 Jun 2013 09:41:52 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	fu14sm17302497wic.8.2013.06.20.09.41.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 20 Jun 2013 09:41:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jun 2013 17:38:22 +0100
Message-Id: <1371746304-16785-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQmNUVLrGGSYtnwGXbn0Gb1y7OLZfoL+777l3zrzHwF4BCpch3xyA49I+8LSPQu3XTeBr9Dr
Subject: [PATCH 0/2] PAM sanity
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
X-List-Received-Date: Thu, 20 Jun 2013 16:41:52 -0000

Hi,

A whitespace fix for libpam, and then something more "interesting".  I spent an
hour earlier cursing my build before finally realising the reason that my PAM
modules were not running on login was because the pam DISTRO_FEATURE wasn't
enabled.  So, here's a patch to make libpam warn if it's being build without the
pam DISTRO_FEATURE.

Ross

Ross Burton (2):
  libpam: fix whitespace in shell function
  libpam: check if PAM is enabled when building

 meta/recipes-extended/pam/libpam_1.1.6.bb |   10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

-- 
1.7.10.4


