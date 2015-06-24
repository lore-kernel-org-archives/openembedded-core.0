Return-Path: <niqingliang2003@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id E705075A36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 02:10:15 +0000 (UTC)
Received: by iecvh10 with SMTP id vh10so24290005iec.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 19:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=QecNKfQH8uzRauQw4WkvwigYWQYErFZ1UUXdgchtf34=;
	b=qdl+Qfz/qy6iF9QKM6N5DtwDn83b1cNNQ/m80LqwOmEQgq3QYPfugyzVKlEYi89s8H
	NN+YzZLOkVabBeIAZr7okeM0VKAVGb2BG1lB7rd4k+7pM0GoiQKEDlaNMOI5l7N8RtCA
	szEooYdfWhZwvP96IW010cbIfJ/090lvY4/oC89BcD0h0IAX2SeJHkPhez7EOr1qGQys
	tfnUNZF5ih2rURRpgagqtnqu0FdbbaL7ZKMauzMAYfunuiDSyyRh78lvxlwX3fX9IKPd
	I4ovYCj3CI+LzHaNQ+R5Xl9nk0HMf9PWKKASOOcXoOSIhbRHAMAr/miiLftF+kKyZ4nz
	LJcQ==
MIME-Version: 1.0
X-Received: by 10.107.3.227 with SMTP id e96mr14913648ioi.50.1435111817291;
	Tue, 23 Jun 2015 19:10:17 -0700 (PDT)
Received: by 10.36.24.74 with HTTP; Tue, 23 Jun 2015 19:10:17 -0700 (PDT)
Date: Wed, 24 Jun 2015 10:10:17 +0800
Message-ID: <CADwFkYfdEMKpzhzJnyDXn0yMDotpdDJ4-jXeYbvu4aAcEBHgOQ@mail.gmail.com>
From: Yi Qingliang <niqingliang2003@gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: zImage-dtb
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
X-List-Received-Date: Wed, 24 Jun 2015 02:10:19 -0000
Content-Type: text/plain; charset=UTF-8

Hello,
    has someone used the "zImage-dtb"?

    the "zImage-dtb" will concatenate multiple dtbs append to zImage.
    How the kernel select dtb in running time?

Yi Qingliang

