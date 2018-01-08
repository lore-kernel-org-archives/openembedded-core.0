Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f51.google.com (mail-pg0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id B029B78950;
	Mon,  8 Jan 2018 15:08:17 +0000 (UTC)
Received: by mail-pg0-f51.google.com with SMTP id t67so5690512pgc.5;
	Mon, 08 Jan 2018 07:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-language;
	bh=GLy5QpDnD1+rTt85r8q/4lUXpmnkwSnE5EHpAKydS0k=;
	b=vgKprfeB20Win3tWgElW+EdMkh8o3G/KJQZWVBBMcalhfPKbvMqeGOyOpqI1EPMnQv
	ysmzDYuQ+hoteMa9Qq/j90CSnCZpYbGqBhe91gUxJU/w9/4OhKgbDiJ13iuzk1ByWK2P
	y6ELLVlwBjEJKE/ZqsF7wKoRDd7tpmY0SfpF8rbv/BZ5KgNujbvxABR32NpNbsPX/CaP
	AwACVM26Wqvk/M1GzeGjKDVDqUQ46rWDgIhDg7/5MZW8a3WdonWwapxNKwr0wTuyXh55
	rzdFO1miWBtAHFqDbZrA8IvRYdZgk2YdaPdrUGjd9a20KRWeSeBUaLcfBkRUnJXNlcGq
	vrug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-language;
	bh=GLy5QpDnD1+rTt85r8q/4lUXpmnkwSnE5EHpAKydS0k=;
	b=X4CJK19OruiVrlwVSm3kEeurr6NgCBlxptzD3iN0QFlp3WzBkpvCCWNa6G8cJ/IeuR
	1PKgEotL+Q7RC+YM//VqAFbCCR9AxvyzjAB9k/i2zQxNgcoZ65XeFwFxOw6pIr4cYWPq
	7AlK1D/31AH2YUKlFjiiPiYBo4RWSA2U27AStz2owkB2mKy7rXvu0wtkpZVNvZaeHdQr
	KQoBg9UDL4qDpowq4wZdxBxVwI4/yMBev9RENlE92szwN6D8n+bcLW1CoX4UgpWeFRz8
	3G9/33xCF0Vfi0fT/WDNBv+P2OSEqzGkwym+cLZPm5JYYXvRr2xtS0Ry2m43ygNM8qlw
	B5GQ==
X-Gm-Message-State: AKGB3mLTKl38apCYe1QkC/os5o50NQAd4wh+oGdzTyKtBs07Ij5ExdEm
	X48UWobcFjnb/Igu2Bha5M9TGA==
X-Google-Smtp-Source: ACJfBot5G9KSE0Q83Pc7FXfukfu824rY9njpYtLDDIgS4nGlr88TSGF/0X/QycW+lZ1lVkuKcJkc7A==
X-Received: by 10.99.115.14 with SMTP id o14mr9539593pgc.282.1515424098612;
	Mon, 08 Jan 2018 07:08:18 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:d3a:c846:b190:ee80?
	([2601:202:4000:1184:d3a:c846:b190:ee80])
	by smtp.gmail.com with ESMTPSA id
	t74sm22671682pgc.67.2018.01.08.07.08.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 07:08:17 -0800 (PST)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <161986bc-e04c-3cdd-c744-5cebff1d4fb7@gmail.com>
Date: Mon, 8 Jan 2018 07:08:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
Subject: Yocto vrs K.O kernel, wireguard go Boom
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
X-List-Received-Date: Mon, 08 Jan 2018 15:08:17 -0000
Content-Type: multipart/alternative;
	boundary="------------3DA334D7A7A980AB08FB8004"
Content-Language: en-US

--------------3DA334D7A7A980AB08FB8004
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

Wireguard in meta-networking is failing do to compat.h issues on newer
kernels. I have updated the package and it fixed=C2=A0 my problem on 4.14=
 K.O
kernel. Now I build it with the Yocko 4.12 and it fails. It wont fail
with a 4.12 K.O kernel. The is one commit that was backported from 4.13
K.O to yocto 4.12 which is causing the issue.

random: add get_random_{bytes,u32,u64,int,long,once}_wait family


	6e4990d8d226e1861a5a2b632cf93bc70feab3af
<http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-4.12/commit/includ=
e/linux/random.h?h=3Dstandard/base&id=3D6e4990d8d226e1861a5a2b632cf93bc70=
feab3af>




=09


=C2=A0I know Yocto is maintaining the 4.12 beyond the K.O release process=
 so
I don't know if this a kernel bug or if I need to come up with some
other solution.


regards,
Armin




--------------3DA334D7A7A980AB08FB8004
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hello,</p>
    <p>Wireguard in meta-networking is failing do to compat.h issues on
      newer kernels. I have updated the package and it fixed  my problem
      on 4.14 K.O kernel. Now I build it with the Yocko 4.12 and it
      fails. It wont fail with a 4.12 K.O kernel. The is one commit that
      was backported from 4.13 K.O to yocto 4.12 which is causing the
      issue.<br>
    </p>
    <p>random: add get_random_{bytes,u32,u64,int,long,once}_wait family</p>
    <table summary="commit info" class="commit-info">
      <tbody>
        <tr>
          <th><br>
          </th>
          <td colspan="2" class="sha1"><a
href="http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-4.12/commit/include/linux/random.h?h=standard/base&amp;id=6e4990d8d226e1861a5a2b632cf93bc70feab3af">6e4990d8d226e1861a5a2b632cf93bc70feab3af</a></td>
        </tr>
      </tbody>
    </table>
    <br>
    <table summary="commit info" class="commit-info">
      <tbody>
        <tr>
          <th><br>
          </th>
          <td colspan="2" class="sha1"><br>
          </td>
        </tr>
      </tbody>
    </table>
    <br>
     I know Yocto is maintaining the 4.12 beyond the K.O release process
    so I don't know if this a kernel bug or if I need to come up with
    some other solution.<br>
    <br>
    <br>
    regards,<br>
    Armin<br>
    <br>
    <br>
    <br>
  </body>
</html>

--------------3DA334D7A7A980AB08FB8004--
