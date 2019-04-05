Return-Path: <jupiter.hce@gmail.com>
Received: from mail-it1-f169.google.com (mail-it1-f169.google.com
	[209.85.166.169])
	by mail.openembedded.org (Postfix) with ESMTP id DACB67D5B9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 11:23:37 +0000 (UTC)
Received: by mail-it1-f169.google.com with SMTP id w15so8895226itc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2019 04:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=AAFuhoOMk2iKMr8SUCN1brzkSHzqnYFR5njy2neTyZE=;
	b=N+OOFO1H/yN+tZn/9OE0kYEuf4U/OAUZvnDI+sfTGZbH9q9SexH6eiV9DogEfOZdcZ
	NCBzdwSfSa8gXwLwgF+ZbmqBo6sLSbbY3FSuky4SzfrblppNZcOnmXRafStGY4EjNQcU
	f+xVYxBeBgt+O8gV7Iss/LeHaukx1EL+YvSWiDlJuC+CVsUfeILOjqChD9qIXhedB5KT
	nof7yTx10VcQ5Sr9iLAh6ies9IygedKhZ30HCHATs8Q9jK49ug8c4/qARmEP0dGxRaU4
	d847yxAYMXaaT85tZU3zVWlMilE5kyL3GS2TZ2UCBCHWonABYyv5F/vU8bJYTTV3T2ni
	X+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=AAFuhoOMk2iKMr8SUCN1brzkSHzqnYFR5njy2neTyZE=;
	b=GzoYNLxHfews4l9H/NYAGN/nkcIX+5TIcHVK6NkrzvXL4ouBYVMN8lSLcM/HewRg8T
	HfO5P3+Z9lo1ccyzyObTbkVFHKRcNIhI5LYBxbEscrDlJ8lF3ykrSr/grqJ1vOY7FYBJ
	Ccu/hWHW/n1oerc0GYEFjInAISxLVrL0QzuOFXsdJqewp7HCn90wTVUzlHc0dDNP8qGC
	LueC97guBCmPehrI067cIxwPlS9sXRXam/n80+VKuubPmOVHfPC9+nSuZoLMvRkMwJCG
	Mf4MyrXKZC8w1JIUuEcKT24jPR7trnIHXk7JHohDDHbAFOrQzjpLfKgKdedD6Shz8x+c
	k1ow==
X-Gm-Message-State: APjAAAUSkVwGmRHXZEeLKkSAjT3o1yQGRpjgsjq5W8Ml2iH9TMspbxGm
	E9idgW7fRq/ljUSfwlMlQdddQ5F9M85QcJl5AiyKWw==
X-Google-Smtp-Source: APXvYqzmvisMqDcCqpIReTlraxK/ho5zILsuNuAnKH4IXoGqOUBMzzL5iNahCQ8mkWNUjshQz/CdjNXhmDWQ7dqWUCU=
X-Received: by 2002:a02:bb91:: with SMTP id g17mr9227635jan.55.1554463418801; 
	Fri, 05 Apr 2019 04:23:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:91a9:0:0:0:0:0 with HTTP;
	Fri, 5 Apr 2019 04:23:38 -0700 (PDT)
From: JH <jupiter.hce@gmail.com>
Date: Fri, 5 Apr 2019 22:23:38 +1100
Message-ID: <CAA=hcWS-6EbpkevDUm3MiS5Y4KFR_5kqO6qD=bbYPJsMXtBJbg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: How to control OS/ABI System V or GNU/Linux?
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
X-List-Received-Date: Fri, 05 Apr 2019 11:23:39 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

I am running OE and bitbake on Ubuntu 18, how do you control the
OS/ABI for System V or GNU/Linux?

I built one shared library which is ELF 32-bit LSB shared object, ARM,
EABI5 version 1 (SYSV), another library which is ELF 32-bit LSB shared
object, ARM, EABI5 version 1 (GNU/Linux), appreciate your tips and
helps.

Thank you.

Kind regards,

- JH

