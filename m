Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 87B517F918
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 11:28:09 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id n14so6364790wrw.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 04:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=o/JymHSja4o5mwbXay9zSL3mTnwM7c0NW69jGXXdwjE=;
	b=Gp5ZJOi5ITruqG48z2k7LcShQgDxUdy010IZP1/n+budN3MguHpgTYZ0UN4nGKuZFh
	hpXv6S5m1GZz8Fabum9Gez9wDIkKtLXlqKjv2XGMlJEpJry76qB9aAn+W1Y/mQwHA4K8
	dUMWdEyMrk7UW2Z0hNtIsUf39V7zse7PzAFpJDdoDO9XmPnR5HpPjOut51SWxJBhJZ3Y
	+gFt2ZXw6bvZNioRKMaOgKDCaF9MGOFKMMax2VL0s4wcyTnCi0wdVXnKiGn/JHEg5r1E
	SJvY53zU3Jg0AfOiBJhomNZp/YG1WrSehkwM7u1MrMv33GVJYwuW4+kr9Tvxq6hKjNHF
	yKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=o/JymHSja4o5mwbXay9zSL3mTnwM7c0NW69jGXXdwjE=;
	b=Riev96+va07H/X17ZXCgKKWuhqNZCl0XDT8+oZMjtwfkatwAxqvk4qEqfQ3RRnNIGQ
	af0lAJQTapTHVPgg5j+yRp6W1IMJB9vWqFI9+uKW004mvHwsBzwWUCLf6k4/nuhe0TjC
	iGufWghz3pacSXJ1YxIgC9r68XqPqQ4kcJRf+zIRrvTdZDj9ELomTpJg5YqaAVmtbBYc
	5gI1tCZhEfN5/nAmuN7K1G2TZsCi97bt8cQq0Cl1EePsDFD6PTv0IYkMeQ/SA2bC6bIM
	00j+7XO6y9rWQxLgHOx9t2VpHLzukddAIGcDfG7cwaQ4GWT4b9odfVrBI3J13AnpR201
	7eMQ==
X-Gm-Message-State: APjAAAV4TtEDTBSCufkXRSQ50jnKDNrIdFWaOBJfTNPCXPZRBFyL9X9q
	W5kqvdk1E+gDla8WnLDaQ5b2hTczg+w=
X-Google-Smtp-Source: APXvYqxv8exsCqY1HENxCBm/A+pJJTYJ7VWyZ/KAOJqoOk4X5hOAKaamGPTmogruSxH/TlvPrV8p2A==
X-Received: by 2002:a05:6000:162e:: with SMTP id
	v14mr11642554wrb.112.1568978890020; 
	Fri, 20 Sep 2019 04:28:10 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	t13sm3347737wra.70.2019.09.20.04.28.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Sep 2019 04:28:09 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Sep 2019 12:28:04 +0100
Message-Id: <20190920112805.32622-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190920112805.32622-1-ross.burton@intel.com>
References: <20190920112805.32622-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] distcc: use --enable-tcp-insecure instead of --make-me-a-botnet
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
X-List-Received-Date: Fri, 20 Sep 2019 11:28:09 -0000
Content-Transfer-Encoding: 8bit

--make-me-a-botnet is worrying, --enable-tcp-insecure is clearer and doesn't
  scare people glancing at 'ps'.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/distcc/files/default | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/distcc/files/default b/meta/recipes-devtools/distcc/files/default
index e5ca68b8561..a5bc13ecf33 100644
--- a/meta/recipes-devtools/distcc/files/default
+++ b/meta/recipes-devtools/distcc/files/default
@@ -21,4 +21,4 @@ ALLOWEDNETS="127.0.0.1"
 #
 # OPTIONS is used for the systemd service file
 #
-OPTIONS="--allow 127.0.0.1 --make-me-a-botnet"
+OPTIONS="--allow 127.0.0.1 --enable-tcp-insecure"
-- 
2.20.1


