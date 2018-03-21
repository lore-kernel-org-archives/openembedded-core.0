Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 58CAB78997
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 16:02:31 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id k187so3363268vke.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 09:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=TVaqNHj69AzlxITW1Aa+Y6ritDxPyCkoE9m3zDVZzsI=;
	b=kqSbGymbyDTUSZSTwGQhNKW1iOyv09flEs1PgGifRIjlsVajhsYU8pd29yqSajIhbY
	VU7kPpO2uZtYbbhcIgJ0OPd8Dx25Bb+Ng1EtlJZE7bOqWH9PZV7Kh48OHLpMnGEcYnQo
	fBov9grBgxtVXrJl99NcxvVdp76OMI/AC2/aX52qAXZcRApBIP8jpLIihHh3EmTrSIlZ
	QC1NAiGUoxz/FzDfsUAwlEUud+Wt+My2ucu8fcBkjM1RwBmF2mHa7kb8dAs7nFSVehls
	D2ec2lN4eyvCq8DvHEuLjXzESDBrFBFLr0+eWq5T+I6N3T0JyYpO5kR50256fx4Mr/0W
	6JEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=TVaqNHj69AzlxITW1Aa+Y6ritDxPyCkoE9m3zDVZzsI=;
	b=ULMhJoKLmuqBluy6fjviyK8jTJm9Q6KrBOqJBvh7bLMbr4MgwYyECZRzm2cJ/w8AWW
	PaWWjkjEUYJSQQsrgw1FWKH//nRXNM548q895GPs+DWGA6PdtWH3lfiWYbl8qZpH0dMk
	4KTYIItPX2CIIASIfRDcCUxaAjSDjfmrfRTW8yOMlxIFjcnyfVKdygQMC76btF5POyXf
	rGsfoWXT/25Hlb+IgBbrQksKws5z09B9iXCCu3D97AY7yWCCJon8M7h1c0Tdrb6UKuAh
	tN6YcaPF7raFmIe8nOqS6rpCOWShFJVTNFHs8eCnVYxgJ7AYJ1n5wA/VOnt7/arjJula
	gF0A==
X-Gm-Message-State: AElRT7FJAudigQlgKtXeQfhdSOIXF1aVbDVxm1bjqZ+u7eQRRCVXMJcD
	gRq0/9su6nP78yfEon3l+H9bKaFrd/ZOQ60sFMWD1mYZ
X-Google-Smtp-Source: AG47ELuAZSCV/N0VyyMRkxeIsHv9poUUDw+hXgK5sTC+Fus9j1+0TTZl1efa9VnKirKojogAPtIVY2Bxpo5gKy9Kl8Y=
X-Received: by 10.31.198.131 with SMTP id w125mr13310623vkf.158.1521648152049; 
	Wed, 21 Mar 2018 09:02:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.34.4 with HTTP; Wed, 21 Mar 2018 09:02:31 -0700 (PDT)
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Wed, 21 Mar 2018 21:32:31 +0530
Message-ID: <CAPGMVzErmFP=J90mdDB5nEJJg4TgPQnBzN3NCrDTYC6S3Aigog@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: package installation
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
X-List-Received-Date: Wed, 21 Mar 2018 16:02:31 -0000
Content-Type: multipart/alternative; boundary="001a114db6c2937bc20567ee516a"

--001a114db6c2937bc20567ee516a
Content-Type: text/plain; charset="UTF-8"

i am to install h5py on yocto's image poky , the below is the repo of it
https://github.com/h5py/h5py

i'd like to know if there is its respective recipe avialble?

Thanks

--001a114db6c2937bc20567ee516a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>i am to install h5py on yocto&#39;s image poky ,=
 the below is the repo of it<br><a href=3D"https://github.com/h5py/h5py">ht=
tps://github.com/h5py/h5py</a><br><br></div>i&#39;d like to know if there i=
s its respective recipe avialble?<br><br></div>Thanks<br><div><div><br></di=
v></div></div>

--001a114db6c2937bc20567ee516a--
