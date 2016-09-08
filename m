Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id C912D7734D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 10:39:16 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id c198so72131547ith.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Sep 2016 03:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ygcYm6Mni7AJM5q0tcEsd3XyTp4ae1M+Y67S7Syzx+o=;
	b=HQW1zNGOW062STAABHE0vJTQzI5ikdoLJ5SiPoZi94bQ6yC/mjkY92Q8hsrfUCYDVi
	srgyU+dEvUppyAfqgTFrvbDsHOJYzn77BP2z7+09pBNc/ztYs/pdtQVyDh/J+h8c/F/r
	mbsAZi1KBExQEsuOwJ8cCFaRNIqdDbXNdKSFspZgnFu7WRo1DAhtUT7IdubuHYaU56R7
	bIsxjKhekrai4mGgQhpSPIX6xMju5mzyA1HwddjC2GnjPSNu1AoJmlClDBm5VPxpcyJa
	SE1FBXjfcVwfDrcaVqFGzlADl4OKVWo/+w+H3isOwbckvVGGGfwX1U9k5g/K2VgBFsVl
	2m8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ygcYm6Mni7AJM5q0tcEsd3XyTp4ae1M+Y67S7Syzx+o=;
	b=NBgoZw8QbuT97OqUkgiXvsIK/6bo5csUQW9D1sjX7Q6cZlDS6oII0e5FpWZesY3zav
	0Rdm2T7TbfsSK6FmvlD69jRHo3cflzeLFHRnqQrV/T/vs8Uuai1B5GC6dh9vals64Xvj
	EM87YOQ3QKnor48xy/XlqVys1nYL2EMMi4AcxQwKG1eltIJ6//S0GBgEVK59gei88n9d
	mKWFKQo1b3HjsiBC4arG/HETfgjChvZ4U5vZqd8tsrJE/2eAyaeUDco4EOfvKdQvMb6p
	0WlqPA7csgXiUzJ9S2KV3p4+2OM5z0JpsUUILkcEo/RjmlQBxSjkbP96yvlEGrlMSI1v
	oNNQ==
X-Gm-Message-State: AE9vXwMM/8okKh1T9ivXaEYa/YiSoa54ReXd2JbchVxrSn1kAigpIJaQ+JJB+cz068U/y27MmGbw5jkNHNC9tzex
X-Received: by 10.36.121.206 with SMTP id z197mr14643466itc.22.1473331157411; 
	Thu, 08 Sep 2016 03:39:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 8 Sep 2016 03:38:56 -0700 (PDT)
In-Reply-To: <20160908012645.25324-1-edwin.plauchu.camacho@linux.intel.com>
References: <20160908012645.25324-1-edwin.plauchu.camacho@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 Sep 2016 11:38:56 +0100
Message-ID: <CAJTo0LYc1ijY-45eFBoCzs9QJp9Cs7Z1=1o7y5zSvwiLVe3zJA@mail.gmail.com>
To: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa: Remove linux user utilized for rpm test.
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
X-List-Received-Date: Thu, 08 Sep 2016 10:39:17 -0000
Content-Type: multipart/alternative; boundary=001a114aa820463b00053bfca415

--001a114aa820463b00053bfca415
Content-Type: text/plain; charset=UTF-8

On 8 September 2016 at 02:26, Edwin Plauchu <
edwin.plauchu.camacho@linux.intel.com> wrote:

>      def test_rpm_query_nonroot(self):
> -        (status, output) = self.target.run('useradd test1')
> +        test_user = 'test1'
> +        (status, output) = self.target.run("useradd %s" % test_user)
>          self.assertTrue(status == 0, msg="Failed to create new user: " +
> output)
> -        (status, output) = self.target.run('su -c id test1')
> +        (status, output) = self.target.run("su -c id %s" % test_user)
>          self.assertTrue('(test1)' in output, msg="Failed to execute as
> new user")
> -        (status, output) = self.target.run('su -c "rpm -qa" test1 ')
> +        (status, output) = self.target.run("su -c \"rpm -qa\" %s " %
> test_user)
>          self.assertEqual(status, 0, msg="status: %s. Cannot run rpm -qa:
> %s" % (status, output))
> +        (status, output) = self.target.run("userdel -r %s" % test_user)
> +        self.assertTrue(status == 0, msg="Failed to erase user: %s" %
> output)
>

The user removal should be in a try/finally block around the test so that
it always executes even if the test fails.

Ross

--001a114aa820463b00053bfca415
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 September 2016 at 02:26, Edwin Plauchu <span dir=3D"ltr">&lt;<a href=
=3D"mailto:edwin.plauchu.camacho@linux.intel.com" target=3D"_blank">edwin.p=
lauchu.camacho@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div id=3D":5uj" class=3D"a3s aXjCH m157076699ff3e4f4">=C2=A0=
 =C2=A0 =C2=A0def test_rpm_query_nonroot(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 (status, output) =3D self.target.run(&#39;user=
add test1&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 test_user =3D &#39;test1&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (status, output) =3D self.target.run(&quot;use=
radd %s&quot; % test_user)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertTrue(status =3D=3D 0, msg=3D&q=
uot;Failed to create new user: &quot; + output)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 (status, output) =3D self.target.run(&#39;su -=
c id test1&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (status, output) =3D self.target.run(&quot;su =
-c id %s&quot; % test_user)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertTrue(&#39;(test1)&#39; in outp=
ut, msg=3D&quot;Failed to execute as new user&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 (status, output) =3D self.target.run(&#39;su -=
c &quot;rpm -qa&quot; test1 &#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (status, output) =3D self.target.run(&quot;su =
-c \&quot;rpm -qa\&quot; %s &quot; % test_user)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(status, 0, msg=3D&quot;s=
tatus: %s. Cannot run rpm -qa: %s&quot; % (status, output))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (status, output) =3D self.target.run(&quot;use=
rdel -r %s&quot; % test_user)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(status =3D=3D 0, msg=3D&quot;F=
ailed to erase user: %s&quot; % output)</div></blockquote></div><br>The use=
r removal should be in a try/finally block around the test so that it alway=
s executes even if the test fails.</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div>

--001a114aa820463b00053bfca415--
