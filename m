Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.1982.1614035145129202248
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 15:05:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QQYuFzER;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id 7so20778294wrz.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 15:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=S453RHl8d7RMHF6Bkl6YyCryQ0J2tquJeeF3potmFqI=;
        b=QQYuFzERM596k16SyPkVEyWdiqBstJnS93roAem7OWs2jBZDk8YkE2/Skwj/L8l2uV
         O8wsJQ8Ehxfwp+w6bS0tnzUrOMNeEMM6kb+b579ICDlXT8SQF77K4S4tWUHRkWiUkVS4
         MvXpp2uXUOZnCZPL7byHb3Jd2vZf/xFU8Jh4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=S453RHl8d7RMHF6Bkl6YyCryQ0J2tquJeeF3potmFqI=;
        b=O+pdzcPxF6+J/BdYie5+6j3NY/13R0jPxTK0rB2TqHeNpwJgZFoL1b59CkhKSXBpto
         e818SNMSl3DDuU0j/jqou70RAwS6Cx76hjWDOh5BVpo57i/aSggUAiYkFiiX+WL0bgmR
         pFgdeuiRl84kHeXmy7pxh4nrLxrxLz+9v6iLlj9ITweEnhuFyZk1b0K+TT+njQXbhI4F
         /arscaCGDR+ZeDO4qVyJQnV9cdZBJivDdTUBmNKvJKRFeqoqN1rQ9Wt8IPKGFA0jm6ls
         Q7zH/oJwfPjNP6fWY0/cJD9uuVPJXqk5r04Dus1TpIkFyTHBe/mGouU4HmgaA6asqEeC
         eXCA==
X-Gm-Message-State: AOAM533f0ivFKKFx5q+aEqrEbeD83QdbYyub47Y+UR9Qebk0yAVRLGbS
	iZI5EVpYyG7DL3cSPX3oqmjYgA==
X-Google-Smtp-Source: ABdhPJwUgM4CtaHi6qURjpS4vaUchPC/6TOnXohvS+/ubuJ4NDg2GO1VepEXaIsKe6w6/M/z2G/Mmg==
X-Received: by 2002:a5d:470e:: with SMTP id y14mr24123199wrq.140.1614035143679;
        Mon, 22 Feb 2021 15:05:43 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:9491:94ce:53e1:ca3c? ([2001:8b0:aba:5f3c:9491:94ce:53e1:ca3c])
        by smtp.gmail.com with ESMTPSA id c62sm674631wme.16.2021.02.22.15.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 15:05:43 -0800 (PST)
Message-ID: <e45373a3e9684d05ef153d75a30792c5a4da3b37.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] go: Update to 1.15.8
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Randy MacLeod
	 <randy.macleod@windriver.com>
Cc: Khem Raj <raj.khem@gmail.com>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Feb 2021 23:05:42 +0000
In-Reply-To: <CANNYZj95gnx7fvXZ-Ox3ic47zDxavKHE2yg_bVVTHBgTrBcTnQ@mail.gmail.com>
References: <20210214084905.3353606-1-raj.khem@gmail.com>
	 <54bd9d57-d197-7a67-6793-8b0800715362@windriver.com>
	 <CANNYZj95gnx7fvXZ-Ox3ic47zDxavKHE2yg_bVVTHBgTrBcTnQ@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-02-22 at 21:39 +0100, Alexander Kanavin wrote:
> This may take time to prepare, and freeze is getting close, so I'd rather take the minor update now.

The minor update already went in, its just a question of whether 1.16 
could be ready in time.

Cheers,

Richard

