Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 420406E64A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 15:59:09 +0000 (UTC)
Received: by mail-ob0-f180.google.com with SMTP id 18so35575233obc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 07:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ICVOr9U0HJVfruzOa1AsLl4EE9RT3YEJnUXnGjyMIh8=;
	b=BU/TTghcX55Ki3EZ2zNWtv/zUTLnxI+aPig6MtXSAhK0Ujb6IVU6zAoFo8jAjRyyvp
	Wmg7Vyu/3gB07j9mrCf/Q1lEvRREwchZlBIXYUcYp3H/2VmGayQQ8QfGwpsMK9j6jbst
	s04i++r1NGXc0KSSjNuGjsfjFTW6VqoNy6ZWSoDboipImWh3kOvdsunNxC5EOoVPMttW
	IC9ALTuGZipYvtEVzN4xZI0VJrjY1/Xo6AN5JwFuaB1C9MDBEoIxOKlSzVUcMnAcScsF
	aJFGIuhDl3Vc0uzOfE08HNqBCAiWUziFxvccINuycbZxlErthfd/LrYR+k/nkP6WfZNn
	QCIA==
X-Received: by 10.182.129.132 with SMTP id nw4mr30054319obb.48.1450281550330; 
	Wed, 16 Dec 2015 07:59:10 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	kw1sm2476980obb.28.2015.12.16.07.59.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 16 Dec 2015 07:59:09 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Dec 2015 07:59:00 -0800
Message-Id: <1450281543-9320-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/3] add gcc-runtime ABI fixes for armv7m and armv7r
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
X-List-Received-Date: Wed, 16 Dec 2015 15:59:11 -0000

Andre McCurdy (3):
  tune-cortexm3.inc: provide an _armv7m over-ride via MACHINEOVERRIDES
  tune-cortexr4.inc: provide an _armv7r over-ride via MACHINEOVERRIDES
  gcc-configure-common.inc: add gcc-runtime ABI fixes for armv7m and armv7r

 meta/conf/machine/include/tune-cortexm3.inc        | 1 +
 meta/conf/machine/include/tune-cortexr4.inc        | 1 +
 meta/recipes-devtools/gcc/gcc-configure-common.inc | 2 ++
 3 files changed, 4 insertions(+)

-- 
1.9.1


