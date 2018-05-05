Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f46.google.com (mail-pg0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id D8DF074DE3;
	Sat,  5 May 2018 00:27:21 +0000 (UTC)
Received: by mail-pg0-f46.google.com with SMTP id z4-v6so16453786pgu.13;
	Fri, 04 May 2018 17:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=AxGuZJr3dh3P6b8pRmCoN/4wIDlupj3flo1wcU8AmHs=;
	b=Nt5K9Dm4OESwcnTHaI8naRDCPXnHMpDoCYx4M4u8q9XKfnBzEEBmH9oIoKknmw4F4W
	NFPV0navgJeAZGurX4PtEU28rYv2T4fExjskEKeDCVrMTdarQVSJekCXhlrdlVEO6ip/
	nCAgFi6Sn5ZHf0knF9pNTsXLJa0OMEd0WtEbHZ6+j497Kat8tYlJd/SuXkR/7ETGN4X/
	os/9yORNaejoDe9r2PDXld99owEIFQMe2KaQ8bEaxLFCGxAGIZ1qKJhiee89jDq58d1L
	2bU1kluEbFVoS69mXn9HbVlvMa9GM7qo4PLZH7mwPHuYDt3vWj+hfpTNFW8xmiIijOaD
	RlNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=AxGuZJr3dh3P6b8pRmCoN/4wIDlupj3flo1wcU8AmHs=;
	b=O6kDIFbaZ/QgQKncLetmQDz5173qLPIQvvUvUPvf72OYIQnoIM4MTMuKW4WA2If6mr
	0GjgnvINUTDUWQgKEg9sN8o3gru3lp6735M2xHQojKM0z5SF9q9XS6CKxwe6oA7a+L2h
	WZKFNTlxmm4E+zNhEELarNRCd8A4TzFlZk9cGxoKkfybPjA5rPfE3UYtuQEZdZHNBA6J
	otNQhAr5DK0tiTiezHKH7X7BF6/4YqkOnHt9sQEfOSb2ZIeFK4GIR+WV3b+Lrvj4RTBh
	/EBFdD2NW8Fjc5OMXMnrDs18Z3wUxrvd9qTBU8kXDcqjpPI3G3Pc92SekVQDTHBuqZug
	iqDA==
X-Gm-Message-State: ALQs6tAhVhc83t3lxLBIsC8VtpGSqRvizmtYYbxpkwKWXqkfa9yAlitE
	P647W9hCP+1FR9zIoCpTlflETM/9eojfejgMKl7PwQ==
X-Google-Smtp-Source: AB8JxZq42GEUbRqo12L+xP755rSGzUp/UFXgzP2udQ0QR39Pr6JCupkn9V5RfgP82DcsP40EJT3MrFFFDD+bZlz8BEY=
X-Received: by 2002:a17:902:59ce:: with SMTP id
	d14-v6mr30353800plj.253.1525480042359; 
	Fri, 04 May 2018 17:27:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.236.159.145 with HTTP; Fri, 4 May 2018 17:26:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 May 2018 17:26:51 -0700
Message-ID: <CAMKF1spa1bbrUjQWbhdUw3C4Cxu99fU=Be3sEm+SYFNq_oxEKw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembeded-devel <Openembedded-devel@lists.openembedded.org>, 
	Yocto Project <yocto@yoctoproject.org>
Subject: [RFT] GCC 8.1
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
X-List-Received-Date: Sat, 05 May 2018 00:27:22 -0000
Content-Type: text/plain; charset="UTF-8"

Hi All

As you might have noticed that gcc 8.1 was released this week, I am
calling out for some testing help on testing branch so we can weed out
issues you might see in your setups. so if you have your
builders idling over weekend, then you know what they can do this weekend :)

Highlighted changes are

https://gcc.gnu.org/gcc-8/changes.html

and porting doc is

https://gcc.gnu.org/gcc-8/porting_to.html

The branch is here

http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc-8

Its uptodate on top of current master oe-core

May fourth be with you !!

Cheers!

-Khem

