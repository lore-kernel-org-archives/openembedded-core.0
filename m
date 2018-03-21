Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0C2AC602D9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 07:18:27 +0000 (UTC)
Received: by mail-vk0-f46.google.com with SMTP id f6so2488541vkh.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 00:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=3Q2GDZVtkR3TuJpopBqFS7ovgE7BQi+BNUPCNgkH4DA=;
	b=aKptbbfcXicyYL8Z4BlHReq+OWkGhX71WbKkmXNsiERef1A+VS2F6b4rd3C6iGretm
	VTnCVt6d74hRUjprkV+aHF4zxbfIngtzLmPfhvSPHgEPIjjuBizaDr0NnHMtdiJ8run5
	8yvtwEYZn14VWM/3Kvj93SmL2fW9xyAaIkTbxqfb9i4hEXVGeJxVM5uzxSalTIW43g4L
	detH9oF8Y5fGoZenMYQDYC49MDsK3+DSffkkQ4G1Wr/teBjkrGJHb2/xxt4zHM4opGom
	TrVFuGAovfEGurFW1PKwgYXyeawD9uACwhH7C77nv7hOii2CYREZgwD0uWI7GEvFPFAv
	FfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=3Q2GDZVtkR3TuJpopBqFS7ovgE7BQi+BNUPCNgkH4DA=;
	b=ENgF7UUO0y+ABovsglHekoBWp9C7M5CJHHGxzsRIXsw3FRPZfDxGYlKEuDa8k2QvKO
	HHZZSarQGAwpfjekep4IcXLn4BeC1CFFU0HEFqNKJqVdUEgVwM9xiIZbNGLfbZDJhcqq
	GCY9uCzP17BkDtYoIcYrsoVLxb7ITOYd8NY7/Bf4FkM8SCl9VtWbRXm6LHYUw9T+R5Gn
	i9T32A9jJJJ6b9Yl6rvm/osYRrlEbjGknske5S2j7oX3DY7HVmGRSogetv75tcxYTbYk
	9wlcRnqmtbyjwN1H4Pb2aDNSjKdwT/Q5L+tWnZUu7zWc7IS9YzW8cLvlfRdeLpLqC7fv
	HrvA==
X-Gm-Message-State: AElRT7Gbw2Q7re4QNhSlFZ18HvPzfpSr0BC3jzzoQxbvtOuxrSK5bm8D
	ezrKDhQ4YMqDutc2qt8ZAG/nnkhuE8g4qGsdSuY=
X-Google-Smtp-Source: AG47ELvTc4IhrgoYkOGpyyQTrX+48n16K5inN+Wv84fzcQJYmk8opyZ2BezvAvcK1175+6k/PexkB0IcUjn1Hzd17iE=
X-Received: by 10.31.198.131 with SMTP id w125mr12230690vkf.158.1521616708547; 
	Wed, 21 Mar 2018 00:18:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.34.4 with HTTP; Wed, 21 Mar 2018 00:18:27 -0700 (PDT)
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Wed, 21 Mar 2018 12:48:27 +0530
Message-ID: <CAPGMVzEjwrXXsEchqDonFeNDBoB7up0espUMk4F8SvLRE3YUfg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: package inclusion error
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
X-List-Received-Date: Wed, 21 Mar 2018 07:18:28 -0000
Content-Type: multipart/alternative; boundary="001a114db6c265ba580567e6ffd1"

--001a114db6c265ba580567e6ffd1
Content-Type: text/plain; charset="UTF-8"

opencv recipe is in meta-oe layer, i have included meta-oe path in
bblayer.config file
and i have also included open cv in IMAGE_INSTALL and have successfully
built the target using bitbake but still when i am doing 'import cv2' on
python terminal on yocto's poky it says 'no moudle named cv2'. what is the
solution?
Thanks

--001a114db6c265ba580567e6ffd1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>opencv recipe is in meta-oe layer, i have includ=
ed meta-oe path in bblayer.config file<br></div>and i have also included op=
en cv in IMAGE_INSTALL and have successfully built the target using bitbake=
 but still when i am doing &#39;import cv2&#39; on python terminal on yocto=
&#39;s poky it says &#39;no moudle named cv2&#39;. what is the solution?<br=
></div>Thanks<br></div>

--001a114db6c265ba580567e6ffd1--
