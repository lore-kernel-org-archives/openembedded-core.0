Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 554B37895C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 05:44:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w225hvOn030851
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 1 Mar 2018 21:43:57 -0800
Received: from [128.224.162.148] (128.224.162.148) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 1 Mar 2018 21:43:56 -0800
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <415639a4-b01a-514e-5eb8-2242cbec1bf9@windriver.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <2f950370-c577-e27d-c162-3c529b041956@windriver.com>
Date: Fri, 2 Mar 2018 13:44:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <415639a4-b01a-514e-5eb8-2242cbec1bf9@windriver.com>
X-Originating-IP: [128.224.162.148]
Cc: yocto@yoctoproject.org
Subject: =?UTF-8?B?UmU6IFF1ZXN0aW9ucyBhYm91dCB1ZGV2IHJ1bGUgYW5kIHN5c3RlbWQtdWRldu+8jHJlbGV2YW50IHRvIG1vdW50aW5nIGJsb2NrIGRldmljZQ==?=
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
X-List-Received-Date: Fri, 02 Mar 2018 05:44:25 -0000
Content-Type: multipart/alternative;
	boundary="------------E6A1C596A50B6D5AF71DB466"
Content-Language: en-US

--------------E6A1C596A50B6D5AF71DB466
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

Does anyone have suggestion for me?

Thanks.

Hongzhi.Song


On 2018年03月01日 18:35, Hongzhi, Song wrote:
>
> Defect:
>
>     The exiting method of automount of udev in /oe-core/meta/ /is using
>
> /automount.rules/ which call /mount.sh/ that using //bin/mount/ to 
> mount device.
>
> But systemd-udevd detaches /mount()/ operations done within the service
>
> from the rest of the system with MountFlag=slave， this means host can
>
> not access device. (e.g. Executing /mkfs.ext4 /dev/sda1// prompts
>
> //dev/sda1 is apparently in use by the system; will not make a 
> filesystem here!/)
>
>
> Solution:
>
>     Systemd upstream suggest that the best way is to use "systemd-mount"
>
> in udev rules, which will request the mount operation to be executed 
> by PID 1.
>
> And I have tested it was effective.
>
>
> Uncertain：
>
>     The exiting method is designed for /SysV-init /which is not 
> compatible to
>
> systemd-udev, at least that's what I think. So I think that we should 
> design
>
> a new rule or organizational structure to be suitable for systemd-udev 
> and
>
> to mount deferent device. Dose anyone help do this? Or I can make some
>
> improvements on the basis of the existing with "systemd-mount".
>
>
>


--------------E6A1C596A50B6D5AF71DB466
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi all,</p>
    <p>Does anyone have suggestion for me?</p>
    <p>Thanks.</p>
    <p>Hongzhi.Song<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 2018年03月01日 18:35, Hongzhi, Song
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:415639a4-b01a-514e-5eb8-2242cbec1bf9@windriver.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <p>Defect:</p>
      <p>    The exiting method of automount of udev in <font
          face="Times New Roman, Times, serif"><i>oe-core/meta/ </i></font>is
        using <br>
      </p>
      <p><font face="Times New Roman, Times, serif"><i>automount.rules</i></font>
        which call <font face="Times New Roman, Times, serif"><i>mount.sh</i></font>
        that using <i><font face="Times New Roman, Times, serif">/bin/mount</font></i>
        to mount device. <br>
      </p>
      <p>But systemd-udevd detaches <font face="Times New Roman, Times,
          serif"><i>mount()</i></font> operations done within the
        service <br>
      </p>
      <p>from the rest of the system with MountFlag=slave， this means
        host can <br>
      </p>
      <p>not access device. (e.g. Executing <font face="Times New
          Roman, Times, serif"><i>mkfs.ext4 /dev/sda1/</i></font>
        prompts <br>
      </p>
      <p><i><font face="Times New Roman, Times, serif">/dev/sda1 is
            apparently in use by the system; will not make a filesystem
            here!</font></i>)<br>
      </p>
      <p><br>
      </p>
      <p>Solution:</p>
      <p>    Systemd upstream suggest that the best way is to use
        "systemd-mount" <br>
      </p>
      <p>in udev rules, which will request the mount operation to be
        executed by PID 1.<br>
      </p>
      <p>And I have tested it was effective.</p>
      <p><br>
      </p>
      <p>Uncertain：</p>
      <p>    The exiting method is designed for <font face="Times New
          Roman, Times, serif"><i>SysV-init </i></font>which is not
        compatible to <br>
      </p>
      <p>systemd-udev, at least that's what I think. So I think that we
        should design</p>
      <p>a new rule or organizational structure to be suitable for
        systemd-udev and <br>
      </p>
      <p>to mount deferent device. Dose anyone help do this? Or I can
        make some <br>
      </p>
      <p>improvements on the basis of the existing with "systemd-mount".<br>
      </p>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------E6A1C596A50B6D5AF71DB466--
