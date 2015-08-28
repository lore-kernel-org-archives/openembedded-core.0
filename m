Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id CA43F71633
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 14:13:43 +0000 (UTC)
Received: by wicfv10 with SMTP id fv10so13350366wic.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 07:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=xowJA+DY8bmniQt63qUgMgFASfATfs9h7obLbFw6ZEs=;
	b=ReSomydNf6IoG9HEQHOtQE0RkyZlhYTrmrJhU+RkktU4XyMN6sEpE+K2QsMAZwQCrK
	Xk0rMlVOa06QecXGpu/nvVkiNQQMiSc5CSvqP+XhLG3/mcmO7CjsZB7MFoabjZFIRrD1
	LyvyLwT5+gvJDILD1pIYISxz2RCZp9seWlvI+KGnAsxDH+pJ10LxAiWTZPPD89sIeA87
	v/bDO9So3eyYNxDe0LxNj0Mc4Tx00dj4bgJZs+mAu3OLEqNbywWXs9fshCFz8Rr0JtXw
	T6SHtnpmp2T4vWEr/mdflXPzIiCq7nHhZjz6vkPWcCa3qGdFsHsnChPBXquPL8d06eM/
	r/SQ==
X-Gm-Message-State: ALoCoQlhHAPiZvOoLEAy0EYW75qJBSXciGXQvVOU+4h1NsIoUIMwGxuOUbhv+Rqg955jQD+7sIVB
X-Received: by 10.194.174.201 with SMTP id bu9mr12820774wjc.73.1440771223465; 
	Fri, 28 Aug 2015 07:13:43 -0700 (PDT)
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com.
	[209.85.212.171])
	by smtp.gmail.com with ESMTPSA id vl1sm8281313wjc.0.2015.08.28.07.13.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Aug 2015 07:13:42 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by wiyy7 with SMTP id y7so235401wiy.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 07:13:42 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.180.92.225 with SMTP id cp1mr4934738wib.2.1440771222329;
	Fri, 28 Aug 2015 07:13:42 -0700 (PDT)
Received: by 10.28.135.72 with HTTP; Fri, 28 Aug 2015 07:13:42 -0700 (PDT)
In-Reply-To: <1440604110-4306-2-git-send-email-nicolas.dechesne@linaro.org>
References: <1440604110-4306-1-git-send-email-nicolas.dechesne@linaro.org>
	<1440604110-4306-2-git-send-email-nicolas.dechesne@linaro.org>
Date: Fri, 28 Aug 2015 11:13:42 -0300
Message-ID: <CAP9ODKqYojUfF=Q8YXkHD30o1Kwi8obMvfJ92rTZ5cH2sXE3Mw@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/2] android-tools: import android-tools from meta-smartphone into oe-core
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
X-List-Received-Date: Fri, 28 Aug 2015 14:13:45 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 26, 2015 at 12:48 PM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> The following changes were done to trim down the recipe size:
> * removed adbd support
> * removed android-tools-conf
>
> The main idea is to keep only what is strictly needed for make_ext4fs tool.
>
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

Can you explain Why?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

