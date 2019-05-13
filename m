Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7ED6F7DF61
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 20:19:01 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id z4so11169253iol.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 13:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WkrGK8Feqnuset29V1irNo8tgDlUFcoz9lP9YMktqWU=;
	b=LmfLVnZhhU1r+v+5NOFlYzDKyczXp+obGr7KJHLe2plCJtCO1rGlKSnpm/SGzwSbV9
	9Z8m5LUx6wC0xaN1KW60LgYrDRMHRNf42l8A7/IHASH2WiQWCtxmVmtIhTsN2EP0sq7m
	BnPj4F2VEqaWaR5yNvoaWfGf6iFdbXFCTNyhKsPJoDE4GqaSyy9TTWDMF35aEZcEfmRk
	SR6w02uCIyO5zw/+bE4Dsdxj4rtMvtxB8o/RLGT+BT5qgFbqNzlLQQTZoYqb0tKLKlpR
	7W87O+UjeHadm7zKWeFgrO2mqxeH+cY/0pyH/kOv20xXd0Q4e08YkdRHHXv5Yc6Gh0ZK
	BjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WkrGK8Feqnuset29V1irNo8tgDlUFcoz9lP9YMktqWU=;
	b=A6oA3Tt4bOrW6tbJdnmq7cW2bq0qPtWpyCIZ7ocy5GN2lCHmOiQZjCawKb6NGbxiEN
	9ymjztRWlHT4f9ZKiqLLR0+U6MFpyu1yxsKHVN3EkDzHAOvE5oPY0m40dZ6dqO3Igt/c
	rPc/dopz9oMrTppLVsLvxjY0NO9Huvhm1KRenDtKYR+y7VZQJGEOJoDMPcDabQp6gQE2
	Dyt7qBKFly3JgqkLOw+mrMgNG3ObHVEDChCl2jFD4BuIWRUcjD0Sq9oE0sMtUVmwdavk
	gkHQCUbl8sU4GBoN37fDy13/op+nJdjzQQ040bZ+wX7fKf6xMBk3AonOqea8CuxBzHSL
	7Vfg==
X-Gm-Message-State: APjAAAW80Smyxm31+M6QHWGceKnypU8N56IRwsvHRvEptV2KNJClyMq3
	gzvhsyI0kcBAaESuYpnnQ8lClE8ShGHsuGJyTbbMPQ==
X-Google-Smtp-Source: APXvYqzxk2sc3w10ByO0S1cC//OvZDtX9QRKCNZaGepmnK+5/gF503j/BwWRUQrEjNja9IU1dcS+/VfEWk7bcKuFABA=
X-Received: by 2002:a05:6602:11a:: with SMTP id
	s26mr16621115iot.201.1557778742626; 
	Mon, 13 May 2019 13:19:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190513112942.14103-1-richard.purdie@linuxfoundation.org>
	<d53f683f-84c5-e6a5-3030-09762663b785@gmail.com>
In-Reply-To: <d53f683f-84c5-e6a5-3030-09762663b785@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 May 2019 13:18:51 -0700
Message-ID: <CAJTo0Lb3kxJQc5zJVAewNx=fgHut0nrcSbbzmCjZNtE=YpgfPw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/target/ssh: Replace suggogatepass with latin-1 codec
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
X-List-Received-Date: Mon, 13 May 2019 20:19:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 May 2019 at 13:17, akuster808 <akuster808@gmail.com> wrote:
> There are hard coded encodings in may places. Would a variable be
> applicable in this case?

I failed to CC the list on a reply, I believe you can consider this
patch dropped.  The universal encoding should be utf-8.

(and when we have a new enough py as a dependency, we can pass
text=True to all these subprocess calls and the encode/decode calls
all disappear)

Ross

