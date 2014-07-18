Return-Path: <joaohf@gmail.com>
Received: from mail-vc0-f172.google.com (mail-vc0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id DF40870247
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jul 2014 03:10:04 +0000 (UTC)
Received: by mail-vc0-f172.google.com with SMTP id im17so6405817vcb.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 20:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=lOvvd3yO82ycAEzwInf438Ra3Uk7JlMJzpzViYT+1e0=;
	b=dU/hvMOK8qW6zhKCLmYezzJXC6rB9rXPHQcgEPsEg5AYZBtqLuLreexHh9uXoprFjj
	12pOr5Er6pJICUMV1DRpGdV8Hs9EbLAvJd7L784huRyQd14tWYrd7Ro+P3ruwffLwWtf
	sy1/XsVgLJrZ0d9rMrFl6uxQv7UzSttNf6JhXOhBUo1xkN+AGkk54zsCDQFri21WeZjU
	pl7imTGSpU4K4hnyhXhOAdt495DKNLiIHNFzjkeQzPG7qESiz3kb0x7wL6wJbIfb8h0V
	OmW910TJn3MJKioZ9kVfmMOvGQ7WG/I7isZNhAuAj7tOeiv4AFIhd+eadCoYP4O6ct1F
	v+LA==
X-Received: by 10.221.4.66 with SMTP id ob2mr1607199vcb.28.1405653005153;
	Thu, 17 Jul 2014 20:10:05 -0700 (PDT)
Received: from localhost.localdomain ([201.53.220.248])
	by mx.google.com with ESMTPSA id 3sm8222020vde.6.2014.07.17.20.10.02
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 Jul 2014 20:10:04 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Jul 2014 00:09:24 -0300
Message-Id: <1405652966-7359-1-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1405378518-4832-1-git-send-email-joaohf@gmail.com>
References: <1405378518-4832-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Cc: otavio@ossystems.com.br
Subject: [PATCH v3 0/2] add nativesdk to BBCLASSEXTEND to python-distribute and to fix the side effect of it.
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
X-List-Received-Date: Fri, 18 Jul 2014 03:10:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes in v3:

 - Use awk and remove two extra forks

João Henrique Ferreira de Freitas (2):
  python-distribute: add nativesdk to BBCLASSEXTEND
  populate_sdk_base: ensure that filenames with empty space character
    are handled

 meta/classes/populate_sdk_base.bbclass                   | 4 ++--
 meta/recipes-devtools/python/python-distribute_0.6.32.bb | 8 +++++++-
 2 files changed, 9 insertions(+), 3 deletions(-)

-- 
1.9.1


