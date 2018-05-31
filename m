Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7BBF174616
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 04:19:15 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id o9-v6so7609411lfk.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 21:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/6M3d7PjpRQdF5MY/mPvM6GDwgT2wvWGid5ocoetPXg=;
	b=iSoZ7siTVlt4xSfzDEcri6Dx1toyR95I1kUeWu5AYgjuKWNwJ6dWD7SDDsQk7j9f7n
	J75brNVN49J1Yipo3Hd7Max2U+ZZeRnc9VRNUFpwmFTWGmHUe1w6rpo8OjDqc1yXFLeQ
	zlhckskWQ1I9IKnwJ65ayMB1w+Uq5LqopSaTiDygLxjcLW4RJ8V8QhqqY5hCnefqN+sf
	yw4e4DUctO+zBPk2mjNcP44Wj1baIozHt99gzOCbwiV6Z5gLrN8I7WfZvGrw/WmqVdA4
	d4ImW05vhMXy8z17hMWm5ubHYlll7zmL1ZeyNCRSq6h9+GG5au1yQlikuoihYlsvARPf
	oObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/6M3d7PjpRQdF5MY/mPvM6GDwgT2wvWGid5ocoetPXg=;
	b=GVJdWbsVn0LTfdS1ptfa6DnjdK1Ms0XDhEffNWAo4DIlbSb7nID7rhOeggUOcEjCc/
	k80Mqi2a8P/HF6JMM7aTq2Xd6JV7p1dC+OVIZaBrIfuNxndziaYmkm+AI0IaZvgfCOw9
	XLCWrQKqgmSTo/q7mJRCPYI1lYhhvJvJuiL0Xzdxd33JTR9z+lO/XNTXipSkqKBzLj1Z
	X8vJD1+wETrpewzSMDgjfPAuSfTmIetzCfVShQrDsldC9P47xdfIk/TSvBBRitk21sQn
	Ax0UM48zavbHvZUcF4I4YsWDMEx/6r/hlVxKpp91AHwY1CfINxSwvMuzvq5XnbRf/9TO
	g8tA==
X-Gm-Message-State: ALKqPwdJTI8KUO86bbqfvt6UE1EGb68NfkY38F4oZ17L8M+qJR0oA5GP
	uspA4e2pUdVBN/0ehMpzUdaTSP+mRjcev0x92eZC8A==
X-Google-Smtp-Source: ADUXVKIEmWZhKVxYFCDQ7q3zOGn2TeWqXjOwpCTaTXF7229C2tUeaNipmXBiL57C2FKB2iUGK4UqG+EuxBHpl7PmOAM=
X-Received: by 2002:a19:54da:: with SMTP id b87-v6mr3018502lfl.3.1527740355675;
	Wed, 30 May 2018 21:19:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:161a:0:0:0:0:0 with HTTP; Wed, 30 May 2018 21:19:15
	-0700 (PDT)
In-Reply-To: <59e700bb0582088cba026b990ed423ab0d1e2ebe.1527735211.git.dengke.du@windriver.com>
References: <cover.1527735211.git.dengke.du@windriver.com>
	<59e700bb0582088cba026b990ed423ab0d1e2ebe.1527735211.git.dengke.du@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 31 May 2018 00:19:15 -0400
Message-ID: <CADkTA4MU3Po893UfDcTeusYA0kkJdMHFHPWx3Z3RdMJS5gj8Xg@mail.gmail.com>
To: Dengke Du <dengke.du@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] linux-yocto: add ptest support
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
X-List-Received-Date: Thu, 31 May 2018 04:19:15 -0000
Content-Type: multipart/alternative; boundary="000000000000358a01056d78c55d"

--000000000000358a01056d78c55d
Content-Type: text/plain; charset="UTF-8"

On Wed, May 30, 2018 at 11:08 PM, Dengke Du <dengke.du@windriver.com> wrote:

> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>  meta/recipes-kernel/linux/files/run-ptest     | 138
> ++++++++++++++++++++++++++
>

Nothing else in linux-yocto uses "files", and this shouldn't either.

We can't guarantee that these are version independent, so they need to be
in  a versioned
kernel subdirectory.



>  meta/recipes-kernel/linux/linux-yocto.inc     |   8 ++
>  meta/recipes-kernel/linux/linux-yocto_4.14.bb |   2 +-
>  3 files changed, 147 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-kernel/linux/files/run-ptest
>
> diff --git a/meta/recipes-kernel/linux/files/run-ptest
> b/meta/recipes-kernel/linux/files/run-ptest
> new file mode 100644
> index 0000000..a3d9e14
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/files/run-ptest
> @@ -0,0 +1,138 @@
> +#!/bin/bash
>

This script should have a license and proper header file.

Also, if the ptests are mainly trace/sample related, name the script to
indicate that.

The kernel already has a significant number of selftests, which are likely
better than
these ptests. Is there any reason why they aren't being used instead ?


> +depmod
> +touch kernel.log
> +
> +#dma-example bytestream-example inttype-example record-example
> +list1=("dma-example" "bytestream-example" "inttype-example"
> "record-example")
> +for i in "${list1[@]}"
> +do
> +  dmesg -c
> +  modprobe "$i"
> +  result=""
> +  IFS="-" read -ra array <<< "$i"
> +  len=${#array[@]}
> +  if [ $len -eq 2 ];then
> +    result="${array[0]}_${array[1]}"
> +  elif [ $len -eq 3 ];then
> +    result="${array[0]}_${array[1]}_${array[2]}"
> +  fi
> +  lsmod | grep -q "$result"
> +  if [ $? -eq 0 ];then
> +    dmesg | grep "test passed"
> +    if [ $? -eq 0 ];then
> +      echo "$i: PASS" >> kernel.log
> +    fi
> +    rmmod "$i"
> +  else
> +    echo "$i: FAILED" >> kernel.log
> +  fi
> +done
> +
> +#kobject-example kset-example
> +list2=("kobject-example" "kset-example")
> +for i in "${list2[@]}"
> +do
> +  dmesg -c
> +  modprobe "$i"
> +  result=""
> +  IFS="-" read -ra array <<< "$i"
> +  len=${#array[@]}
> +  if [ $len -eq 2 ];then
> +    result="${array[0]}_${array[1]}"
> +  elif [ $len -eq 3 ];then
> +    result="${array[0]}_${array[1]}_${array[2]}"
> +  fi
> +  basedir="/sys/kernel/${result}"
> +  echo "$basedir"
> +  if [ -e ${basedir}/bar -a -e ${basedir}/baz -a -e ${basedir}/foo ];then
> +    echo "$i: PASS" >> kernel.log
> +    rmmod "$i"
> +  else
> +    echo "$i: FAILED" >> kernel.log
> +  fi
> +done
> +
> +#trace-events-sample
> +list3="trace-events-sample"
> +result=""
> +IFS="-" read -ra array <<< "$list3"
> +len=${#array[@]}
> +if [ $len -eq 2 ];then
> +  result="${array[0]}_${array[1]}"
> +elif [ $len -eq 3 ];then
> +  result="${array[0]}_${array[1]}_${array[2]}"
> +fi
> +modprobe "$list3"
> +lsmod | grep "$result"
> +if [ $? -eq 0 ];then
> +  if [ -e "/sys/kernel/debug/tracing/events/sample-trace" ];then
> +    echo 1 > /sys/kernel/debug/tracing/events/sample-trace/enable
> +    sleep 5
> +    ret=`cat /sys/kernel/debug/tracing/trace | grep hello | head -n1 |
> cut -d':' -f2`
> +    if [ "$ret" = " foo_bar" ];then
> +      echo "$list3: PASS"  >> kernel.log
> +    else
> +      echo "$list3: FAILED-" >> kernel.log
> +    fi
> +  else
> +    echo "$list3: FAILED--" >> kernel.log
> +  fi
> +else
> +  echo "$list3: FAILED---" >> kernel.log
> +fi
> +rmmod "$list3"
> +
> +#trace-printk
> +list4="trace-printk"
> +modprobe "$list4"
> +lsmod | grep "trace_printk"
> +if [ $? -eq 0 ];then
> +  ret=`cat /sys/kernel/debug/tracing/trace | grep trace_printk | head
> -n1 | cut -d':' -f2`
> +  if [ "$ret" = " trace_printk_irq_work" ];then
> +    echo "$list4: PASS" >> kernel.log
> +    rmmod "$list4"
> +  else
> +    echo "$list4: FAILED" >> kernel.log
> +  fi
> +else
> +  echo "$list4: FAILED" >> kernel.log
> +fi
> +rmmod "$list4"
> +
> +#kprobe_example
> +list5="kprobe_example"
> +dmesg -c
> +modprobe "$list5"
> +lsmod | grep "$list5"
> +if [ $? -eq 0 ];then
> +  dmesg | grep "_do_fork"
> +  if [ $? -eq 0 ];then
> +    echo "$list5: PASS" >> kernel.log
> +  else
> +    echo "$list5: FAILED" >> kernel.log
> +  fi
> +else
> +  echo "$list5: FAILED" >> kernel.log
> +fi
> +rmmod "$list5"
> +
> +#kretprobe_example
> +list6="kretprobe_example"
> +dmesg -c
> +modprobe "$list6"
> +lsmod | grep "$list6"
> +if [ $? -eq 0 ];then
> +  dmesg | grep "_do_fork returned"
> +  if [ $? -eq 0 ];then
> +    echo "$list6: PASS" >> kernel.log
> +  else
> +    echo "$list6: FAILED" >> kernel.log
> +  fi
> +else
> +  echo "$list6: FAILED" >> kernel.log
> +fi
> +rmmod "$list6"
> +
> +echo "#####result#####"
> +cat kernel.log
> +rm kernel.log
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
> b/meta/recipes-kernel/linux/linux-yocto.inc
> index 95ec2a2..7e1773e 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -67,3 +67,11 @@ do_install_append(){
>  addtask kernel_version_sanity_check after do_kernel_metadata
> do_kernel_checkout before do_compile
>  addtask validate_branches before do_patch after do_kernel_checkout
>  addtask kernel_configcheck after do_configure before do_compile
> +
> +inherit ptest
> +SRC_URI_append = " file://run-ptest \
> +"
> +do_install_ptest_append() {
> +       install -D ${WORKDIR}/run-ptest ${D}${PTEST_PATH}/run-ptest
> +}
> +KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES",
> "ptest", "features/kernel-sample/kernel-sample.scc", "", d)}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
> b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
> index 16142f8..7002693 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
> @@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "
> 74f6cd2b6976e37491779fcb1bc4966d3a61492c"
>  SRCREV_machine_qemux86-64 ?= "74f6cd2b6976e37491779fcb1bc4966d3a61492c"
>  SRCREV_machine_qemumips64 ?= "9863b327e770b42b8c18da3e0cfaf06e8f99ae97"
>  SRCREV_machine ?= "74f6cd2b6976e37491779fcb1bc4966d3a61492c"
> -SRCREV_meta ?= "ea9330894eea727bd1655569b16f338976b72563"
> +SRCREV_meta ?= "53336e1b7d969f21d8214ec9ceeb48fba4f99372"
>

Do not bump the SRCREV for meta in this series.

If your feature depends on something in the meta branch (which it does),
wait until I've sent my next series before sending this.

Bruce


>
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;
> branch=${KBRANCH}; \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;
> name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--000000000000358a01056d78c55d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, May 30, 2018 at 11:08 PM, Dengke Du <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:dengke.du@windriver.com" target=3D"_blank">dengke.du@windriver=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Signed-off-by:=
 Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com">dengke.du@windriv=
er.com</a>&gt;<br>
---<br>
<span class=3D"">=C2=A0meta/recipes-kernel/linux/<wbr>files/run-ptest=C2=A0=
 =C2=A0 =C2=A0| 138 ++++++++++++++++++++++++++<br></span></blockquote><div>=
<br></div><div>Nothing else in linux-yocto uses &quot;files&quot;, and this=
 shouldn&#39;t either.</div><div><br></div><div>We can&#39;t guarantee that=
 these are version independent, so they need to be in=C2=A0 a versioned</di=
v><div>kernel subdirectory.</div><div><br></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><span class=3D"">
=C2=A0meta/recipes-kernel/linux/<wbr>linux-yocto.inc=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A08 ++<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.14.bb" rel=
=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto_4.14.bb</a> |=C2=A0 =C2=
=A02 +-<br>
=C2=A03 files changed, 147 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-kernel/linux/<wbr>files/run-ptest<br>
<br>
</span>diff --git a/meta/recipes-kernel/linux/<wbr>files/run-ptest b/meta/r=
ecipes-kernel/linux/<wbr>files/run-ptest<br>
new file mode 100644<br>
index 0000000..a3d9e14<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/linux/<wbr>files/run-ptest<br>
@@ -0,0 +1,138 @@<br>
+#!/bin/bash<br></blockquote><div><br></div><div>This script should have a =
license and proper header file.</div><div><br></div><div>Also, if the ptest=
s are mainly trace/sample related, name the script to indicate that.</div><=
div><br></div><div>The kernel already has a significant number of selftests=
, which are likely better than</div><div>these ptests. Is there any reason =
why they aren&#39;t being used instead ?</div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">
+depmod<br>
+touch kernel.log<br>
+<br>
+#dma-example bytestream-example inttype-example record-example<br>
+list1=3D(&quot;dma-example&quot; &quot;bytestream-example&quot; &quot;intt=
ype-example&quot; &quot;record-example&quot;)<br>
+for i in &quot;${list1[@]}&quot;<br>
+do<br>
+=C2=A0 dmesg -c<br>
+=C2=A0 modprobe &quot;$i&quot;<br>
+=C2=A0 result=3D&quot;&quot;<br>
+=C2=A0 IFS=3D&quot;-&quot; read -ra array &lt;&lt;&lt; &quot;$i&quot;<br>
+=C2=A0 len=3D${#array[@]}<br>
+=C2=A0 if [ $len -eq 2 ];then<br>
+=C2=A0 =C2=A0 result=3D&quot;${array[0]}_${array[1]<wbr>}&quot;<br>
+=C2=A0 elif [ $len -eq 3 ];then<br>
+=C2=A0 =C2=A0 result=3D&quot;${array[0]}_${array[1]<wbr>}_${array[2]}&quot=
;<br>
+=C2=A0 fi<br>
+=C2=A0 lsmod | grep -q &quot;$result&quot;<br>
+=C2=A0 if [ $? -eq 0 ];then<br>
+=C2=A0 =C2=A0 dmesg | grep &quot;test passed&quot;<br>
+=C2=A0 =C2=A0 if [ $? -eq 0 ];then<br>
+=C2=A0 =C2=A0 =C2=A0 echo &quot;$i: PASS&quot; &gt;&gt; kernel.log<br>
+=C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 rmmod &quot;$i&quot;<br>
+=C2=A0 else<br>
+=C2=A0 =C2=A0 echo &quot;$i: FAILED&quot; &gt;&gt; kernel.log<br>
+=C2=A0 fi<br>
+done<br>
+<br>
+#kobject-example kset-example<br>
+list2=3D(&quot;kobject-example&quot; &quot;kset-example&quot;)<br>
+for i in &quot;${list2[@]}&quot;<br>
+do<br>
+=C2=A0 dmesg -c<br>
+=C2=A0 modprobe &quot;$i&quot;<br>
+=C2=A0 result=3D&quot;&quot;<br>
+=C2=A0 IFS=3D&quot;-&quot; read -ra array &lt;&lt;&lt; &quot;$i&quot;<br>
+=C2=A0 len=3D${#array[@]}<br>
+=C2=A0 if [ $len -eq 2 ];then<br>
+=C2=A0 =C2=A0 result=3D&quot;${array[0]}_${array[1]<wbr>}&quot;<br>
+=C2=A0 elif [ $len -eq 3 ];then<br>
+=C2=A0 =C2=A0 result=3D&quot;${array[0]}_${array[1]<wbr>}_${array[2]}&quot=
;<br>
+=C2=A0 fi<br>
+=C2=A0 basedir=3D&quot;/sys/kernel/${result}<wbr>&quot;<br>
+=C2=A0 echo &quot;$basedir&quot;<br>
+=C2=A0 if [ -e ${basedir}/bar -a -e ${basedir}/baz -a -e ${basedir}/foo ];=
then<br>
+=C2=A0 =C2=A0 echo &quot;$i: PASS&quot; &gt;&gt; kernel.log<br>
+=C2=A0 =C2=A0 rmmod &quot;$i&quot;<br>
+=C2=A0 else<br>
+=C2=A0 =C2=A0 echo &quot;$i: FAILED&quot; &gt;&gt; kernel.log<br>
+=C2=A0 fi<br>
+done<br>
+<br>
+#trace-events-sample<br>
+list3=3D&quot;trace-events-sample&quot;<br>
+result=3D&quot;&quot;<br>
+IFS=3D&quot;-&quot; read -ra array &lt;&lt;&lt; &quot;$list3&quot;<br>
+len=3D${#array[@]}<br>
+if [ $len -eq 2 ];then<br>
+=C2=A0 result=3D&quot;${array[0]}_${array[1]<wbr>}&quot;<br>
+elif [ $len -eq 3 ];then<br>
+=C2=A0 result=3D&quot;${array[0]}_${array[1]<wbr>}_${array[2]}&quot;<br>
+fi<br>
+modprobe &quot;$list3&quot;<br>
+lsmod | grep &quot;$result&quot;<br>
+if [ $? -eq 0 ];then<br>
+=C2=A0 if [ -e &quot;/sys/kernel/debug/tracing/<wbr>events/sample-trace&qu=
ot; ];then<br>
+=C2=A0 =C2=A0 echo 1 &gt; /sys/kernel/debug/tracing/<wbr>events/sample-tra=
ce/enable<br>
+=C2=A0 =C2=A0 sleep 5<br>
+=C2=A0 =C2=A0 ret=3D`cat /sys/kernel/debug/tracing/<wbr>trace | grep hello=
 | head -n1 | cut -d&#39;:&#39; -f2`<br>
+=C2=A0 =C2=A0 if [ &quot;$ret&quot; =3D &quot; foo_bar&quot; ];then<br>
+=C2=A0 =C2=A0 =C2=A0 echo &quot;$list3: PASS&quot;=C2=A0 &gt;&gt; kernel.l=
og<br>
+=C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 echo &quot;$list3: FAILED-&quot; &gt;&gt; kernel.log<=
br>
+=C2=A0 =C2=A0 fi<br>
+=C2=A0 else<br>
+=C2=A0 =C2=A0 echo &quot;$list3: FAILED--&quot; &gt;&gt; kernel.log<br>
+=C2=A0 fi<br>
+else<br>
+=C2=A0 echo &quot;$list3: FAILED---&quot; &gt;&gt; kernel.log<br>
+fi<br>
+rmmod &quot;$list3&quot;<br>
+<br>
+#trace-printk<br>
+list4=3D&quot;trace-printk&quot;<br>
+modprobe &quot;$list4&quot;<br>
+lsmod | grep &quot;trace_printk&quot;<br>
+if [ $? -eq 0 ];then<br>
+=C2=A0 ret=3D`cat /sys/kernel/debug/tracing/<wbr>trace | grep trace_printk=
 | head -n1 | cut -d&#39;:&#39; -f2`<br>
+=C2=A0 if [ &quot;$ret&quot; =3D &quot; trace_printk_irq_work&quot; ];then=
<br>
+=C2=A0 =C2=A0 echo &quot;$list4: PASS&quot; &gt;&gt; kernel.log<br>
+=C2=A0 =C2=A0 rmmod &quot;$list4&quot;<br>
+=C2=A0 else<br>
+=C2=A0 =C2=A0 echo &quot;$list4: FAILED&quot; &gt;&gt; kernel.log<br>
+=C2=A0 fi<br>
+else<br>
+=C2=A0 echo &quot;$list4: FAILED&quot; &gt;&gt; kernel.log<br>
+fi<br>
+rmmod &quot;$list4&quot;<br>
+<br>
+#kprobe_example<br>
+list5=3D&quot;kprobe_example&quot;<br>
+dmesg -c<br>
+modprobe &quot;$list5&quot;<br>
+lsmod | grep &quot;$list5&quot;<br>
+if [ $? -eq 0 ];then<br>
+=C2=A0 dmesg | grep &quot;_do_fork&quot;<br>
+=C2=A0 if [ $? -eq 0 ];then<br>
+=C2=A0 =C2=A0 echo &quot;$list5: PASS&quot; &gt;&gt; kernel.log<br>
+=C2=A0 else<br>
+=C2=A0 =C2=A0 echo &quot;$list5: FAILED&quot; &gt;&gt; kernel.log<br>
+=C2=A0 fi<br>
+else<br>
+=C2=A0 echo &quot;$list5: FAILED&quot; &gt;&gt; kernel.log<br>
+fi<br>
+rmmod &quot;$list5&quot;<br>
+<br>
+#kretprobe_example<br>
+list6=3D&quot;kretprobe_example&quot;<br>
+dmesg -c<br>
+modprobe &quot;$list6&quot;<br>
+lsmod | grep &quot;$list6&quot;<br>
+if [ $? -eq 0 ];then<br>
+=C2=A0 dmesg | grep &quot;_do_fork returned&quot;<br>
+=C2=A0 if [ $? -eq 0 ];then<br>
+=C2=A0 =C2=A0 echo &quot;$list6: PASS&quot; &gt;&gt; kernel.log<br>
+=C2=A0 else<br>
+=C2=A0 =C2=A0 echo &quot;$list6: FAILED&quot; &gt;&gt; kernel.log<br>
+=C2=A0 fi<br>
+else<br>
+=C2=A0 echo &quot;$list6: FAILED&quot; &gt;&gt; kernel.log<br>
+fi<br>
+rmmod &quot;$list6&quot;<br>
+<br>
+echo &quot;#####result#####&quot;<br>
+cat kernel.log<br>
+rm kernel.log<br>
diff --git a/meta/recipes-kernel/linux/<wbr>linux-yocto.inc b/meta/recipes-=
kernel/linux/<wbr>linux-yocto.inc<br>
index 95ec2a2..7e1773e 100644<br>
--- a/meta/recipes-kernel/linux/<wbr>linux-yocto.inc<br>
+++ b/meta/recipes-kernel/linux/<wbr>linux-yocto.inc<br>
@@ -67,3 +67,11 @@ do_install_append(){<br>
=C2=A0addtask kernel_version_sanity_check after do_kernel_metadata do_kerne=
l_checkout before do_compile<br>
=C2=A0addtask validate_branches before do_patch after do_kernel_checkout<br=
>
=C2=A0addtask kernel_configcheck after do_configure before do_compile<br>
+<br>
+inherit ptest<br>
+SRC_URI_append =3D &quot; file://run-ptest \<br>
+&quot;<br>
+do_install_ptest_append() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -D ${WORKDIR}/run-ptest ${D}${PTEST_PAT=
H}/run-ptest<br>
+}<br>
+KERNEL_FEATURES_append =3D &quot; ${@bb.utils.contains(&quot;DISTRO_<wbr>F=
EATURES&quot;, &quot;ptest&quot;, &quot;features/kernel-sample/<wbr>kernel-=
sample.scc&quot;, &quot;&quot;, d)}&quot;<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.14.b=
b" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.14.bb</a> b/meta=
/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.14.bb" rel=3D"norefer=
rer" target=3D"_blank">li<wbr>nux-yocto_4.14.bb</a><br>
index 16142f8..7002693 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.14.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.14.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.14.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.14.bb</a><br>
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?=3D &quot;<wbr>74f6cd2b6976e37491=
779fcb1bc496<wbr>6d3a61492c&quot;<br>
=C2=A0SRCREV_machine_qemux86-64 ?=3D &quot;<wbr>74f6cd2b6976e37491779fcb1bc=
496<wbr>6d3a61492c&quot;<br>
=C2=A0SRCREV_machine_qemumips64 ?=3D &quot;<wbr>9863b327e770b42b8c18da3e0cf=
af0<wbr>6e8f99ae97&quot;<br>
=C2=A0SRCREV_machine ?=3D &quot;<wbr>74f6cd2b6976e37491779fcb1bc496<wbr>6d3=
a61492c&quot;<br>
-SRCREV_meta ?=3D &quot;<wbr>ea9330894eea727bd1655569b16f33<wbr>8976b72563&=
quot;<br>
+SRCREV_meta ?=3D &quot;<wbr>53336e1b7d969f21d8214ec9ceeb48<wbr>fba4f99372&=
quot;<br></blockquote><div><br></div><div>Do not bump the SRCREV for meta i=
n this series.</div><div><br></div><div>If your feature depends on somethin=
g in the meta branch (which it does), wait until I&#39;ve sent my next seri=
es before sending this.</div><div><br></div><div>Bruce</div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/linux-=
yocto.git;name=3Dmachine;branch=3D${KBRANCH}" rel=3D"noreferrer" target=3D"=
_blank">git.yoctoproject.org/<wbr>linux-yocto.git;name=3Dmachine;<wbr>branc=
h=3D${KBRANCH}</a>; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://git.yocto=
project.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-4.14=
;destsuffix=3D${KMETA}" rel=3D"noreferrer" target=3D"_blank">git.yoctoproje=
ct.org/<wbr>yocto-kernel-cache;type=3Dkmeta;<wbr>name=3Dmeta;branch=3Dyocto=
-4.14;<wbr>destsuffix=3D${KMETA}</a>&quot;<br>
<div class=3D"HOEnZb"><div class=3D"h5">-- <br>
2.7.4<br>
<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div></div>

--000000000000358a01056d78c55d--
