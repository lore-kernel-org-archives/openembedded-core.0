Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id 65F7971DEE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 13:04:03 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id w135so15636525oie.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 05:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=nuGcwiMS56u1dvpAqmeUdnDzWaT5GlkiYmzcfgbvtbA=;
	b=dNtbeLUIZGvRQi8pR+e69qAainVFWK5AdfAWEA8/oRZ6SBAZhYW47Y6hBRjgP+gcwA
	DEKuLDb9ZEJC/yHmsybOvo/ARpyA7pFpYolQGuZrZFE00wHf00herCV9bAlumLQC8POr
	pDMJY24HWW/arVcJtBJb30a5u3YKFLv8bJJk9yRvh4Cg7AZ9Lbp4jaSZWfOULcYb9g47
	3Wj6pFWkBSCSiAzEwAC2ZZGtW7wqgx7M/hf+9qSeCSiapEJgT1HFB5DqmV01qyKVQHk1
	+r2q2GEhBVPBOBL6hqn++TNkLRpAOxuIvlnsMZHv2Lv8jeamz+K7akNvUWfkyEzmi1ph
	YEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=nuGcwiMS56u1dvpAqmeUdnDzWaT5GlkiYmzcfgbvtbA=;
	b=pmZWhS6YPOdi+MIEJmNuFrV3CnnXkRuBqzAMwukNyqHnZybMzpF/J6BaR9AGT8pP46
	2/+1fG18g3O2Fs0eD9CSEHT0XEvHYPbFecFXQb2S5vEPq4zJXmHGhidaFHtDETNFOP2Y
	PZg4xEObEAAkJe8mx8u5YqrWG/O8KVEADgGnlgAFRLXsbhxpB5ht8cT9gpYdUCPS+Yjw
	HUbCrQgDS3o1A9AfomCJPH6GTjx7ZY21IkoRnNK/zT/W8SsoajmmF/tmRevhbSo2BNqq
	kMJ5GKqL9dduJrsj5zfeKr8xGOmRo3dtnWxVHTtFXpkLI/NhGqpGPuLPq7JSnTO7cbCP
	WyOA==
X-Gm-Message-State: AKwxytc3R4nhMs3kyekz+sGQh3MDLXjjsFMAjqabzp3xqZKAJpbUvE8j
	IYiXYVZzM5R4pAIb686lPuNU5FGI
X-Google-Smtp-Source: ACJfBovrC/Ci9iVMXG/1mW+oIp+htcRTBj9jhFrTIuZ9W1lIacueu0T9MQMsCKnafIaGg0l+KsDBQg==
X-Received: by 10.202.78.146 with SMTP id c140mr2934788oib.312.1516280643924; 
	Thu, 18 Jan 2018 05:04:03 -0800 (PST)
Received: from mail-ot0-f176.google.com (mail-ot0-f176.google.com.
	[74.125.82.176]) by smtp.gmail.com with ESMTPSA id
	s92sm3208177ota.45.2018.01.18.05.04.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Jan 2018 05:04:02 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f176.google.com with SMTP id t35so13325167otd.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 05:04:02 -0800 (PST)
X-Received: by 10.157.37.8 with SMTP id k8mr3354074otb.392.1516280641942; Thu,
	18 Jan 2018 05:04:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.38.102 with HTTP; Thu, 18 Jan 2018 05:04:01 -0800 (PST)
In-Reply-To: <20180118123804.2465-1-ross.burton@intel.com>
References: <20180118123804.2465-1-ross.burton@intel.com>
Date: Thu, 18 Jan 2018 11:04:01 -0200
X-Gmail-Original-Message-ID: <CAP9ODKrYD+h=uC-u4P=G7RqwkvKi=X_tyQMbeaX9w84b_StF+A@mail.gmail.com>
Message-ID: <CAP9ODKrYD+h=uC-u4P=G7RqwkvKi=X_tyQMbeaX9w84b_StF+A@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] cmake: allow the generator to be changed
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
X-List-Received-Date: Thu, 18 Jan 2018 13:04:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 18, 2018 at 10:38 AM, Ross Burton <ross.burton@intel.com> wrote:
> Add OECMAKE_GENERATOR variable to control which generator is used by CMake,
> defaulting to the upstream default of Unix Makefiles for now.  The other
> supported option is Ninja, which is faster than Make for large projects (for
> example, using Ninja takes three minutes off webkitgtk:do_compile for me).
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

