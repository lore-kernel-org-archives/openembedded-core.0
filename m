Return-Path: <rudolf.streif@ibeeto.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 883BB7D6A3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 00:19:56 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id h17so3151769pgv.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2019 17:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ibeeto-com.20150623.gappssmtp.com; s=20150623;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-language;
	bh=tuffvTme8PKSgCzPLeh3Jimhqy5pu58TgLC4MfxpupU=;
	b=PwzpWTdgVTeWWGP3G6pzrQLSQGTLpEeF3i60zztMB2ce77FbWBmOba2uK1HXA0Z+7D
	RtiDRF5r6TqkF1ZQ91LP5i2fKwydbapWVnsAKr09yr/vBDJvaNLQkowdAwE1ppczMPMW
	j6yfg+I2qGiviM4lKK9lB3hJzH8xi7u19AVYLhrrnv2x1Q8jgqwFsTGQmv8PcP4qi1aw
	zNKoYYpsbHf69jgtF1LoYxLpUn2TPtJ9AGsmyLODQGpjuJ99UlyIUqyPiFnTb43zf23w
	3/JRNKXQEkdcQQi4hs4afT5vjMM7jW0pJ5szPGmf6oyetTYFhdIAivskDVr2OEtMJvwY
	27hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-language;
	bh=tuffvTme8PKSgCzPLeh3Jimhqy5pu58TgLC4MfxpupU=;
	b=rN9YbpJOT6XCA8vjlZpKYRNT7LrZfK+1pKgfImJH+r8Y+f09mm5ilQ4byaE8rDtXiO
	9W8gx2bfQRzY4ia/17JLLaCJXiUhpcXiNIyilNxz9CKzfuvtrGMCvZTmnSsVwOlmoiVP
	bjJfV2cmRqaTupukSOVGPfJRJnSTfsEzpGMXAG07eFmpOYb/pVfk0cyJKn3pYl2QZv7X
	VxPWGlVYQ/AsE7NkhSQjWv6gwFRfQ2QbRZehnXMmGMUIfKooVNgXIleu2mEx8BKaa2ne
	thdyOX99PIJMRQJ4KNpxadVWUnUykTlPSrzLfE/D8yGWVcnkmlVr65vN24+v6Olu0qiJ
	0QWA==
X-Gm-Message-State: APjAAAVazi9NHy9Pqm2G+OeEdJZF7OaI92zsq/FCa3o8iJW0kylEQEKO
	u/NpfWrcYBc8xu2mWSLZwvB+G9AQzIg=
X-Google-Smtp-Source: APXvYqzAnM01LIFxn8y2B3iqEwXeF9/7OmM04K3MvIE3ufv0w4ea3ZUC4ynVIpglH0fzF+S9J2aF2g==
X-Received: by 2002:a63:6981:: with SMTP id e123mr43050975pgc.28.1557274796929;
	Tue, 07 May 2019 17:19:56 -0700 (PDT)
Received: from rjs-zotac.ibeeto.com (ip68-7-84-58.sd.sd.cox.net. [68.7.84.58])
	by smtp.gmail.com with ESMTPSA id
	a129sm18301631pfa.152.2019.05.07.17.19.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 May 2019 17:19:55 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
From: Rudolf J Streif <rudolf.streif@ibeeto.com>
Message-ID: <ae370e65-a910-2964-b31a-bb5b1b3636d6@ibeeto.com>
Date: Tue, 7 May 2019 17:19:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
Subject: [meta-oe] sip/sip3
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
X-List-Received-Date: Wed, 08 May 2019 00:19:56 -0000
Content-Type: multipart/alternative;
	boundary="------------A30639AF236F4CCD4C791AD9"
Content-Language: en-US

--------------A30639AF236F4CCD4C791AD9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

With the recent update of sip/sip3 from 4.19.13 to 4.19.16 FILES has 
changed:

4.19.13:

|

FILES_python3-sip3  =  "${libdir}/${PYTHON_DIR}${PYTHON_ABI}/site-packages/"
FILES_${PN}-dbg  +=  "${libdir}/${PYTHON_DIR}${PYTHON_ABI}/site-packages/.debug"|

4.19.16 (meta-openembedded @ 50108c18):

|

FILES_python-sip  =  "${libdir}/${PYTHON_DIR}/site-packages/"
FILES_${PN}-dbg  +=  "${libdir}/${PYTHON_DIR}/site-packages/.debug"|

|

|

|

|

That causes an issue with PyQt5 which is installed in (python-pyqt5.inc, 
meta-qt5 @ f4531ec8):

echo "py_pylib_dir = 
%(sysroot)/${libdir}/python${PYTHON_BASEVERSION}${PYTHON_ABI}" >> pyqt.cfg

PYTHON_BASEVERSION = "3.7"
PYTHON_ABI = "m"

This can obviously be fixed on either end, but I am not quite sure what 
the right approach is.

Thanks,

Rudi


  -----
Rudolf J Streif
CEO/CTO ibeeto
+1.855.442.3396 x700


--------------A30639AF236F4CCD4C791AD9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>With the recent update of sip/sip3 from 4.19.13 to 4.19.16 FILES
      has changed:</p>
    <p>4.19.13:</p>
    <pre><code><pre><span class="nv">FILES_python3</span><span class="o">-</span><span class="nv">sip3</span> <span class="o">=</span> <span class="s2">"${libdir}/${PYTHON_DIR}${PYTHON_ABI}/site-packages/"</span>
<span class="nv">FILES_</span><span class="kt">$</span><span class="err">{</span><span class="nv">PN</span><span class="err">}</span><span class="o">-</span><span class="nv">dbg</span> <span class="o">+=</span> <span class="s2">"${libdir}/${PYTHON_DIR}${PYTHON_ABI}/site-packages/.debug"</span></pre></code></pre>
    <p>4.19.16 (meta-openembedded @ 50108c18):</p>
    <pre><code><pre><span class="nv">FILES_python</span><span class="o">-</span><span class="nv">sip</span> <span class="o">=</span> <span class="s2">"${libdir}/${PYTHON_DIR}/site-packages/"</span>
<span class="nv">FILES_</span><span class="kt">$</span><span class="err">{</span><span class="nv">PN</span><span class="err">}</span><span class="o">-</span><span class="nv">dbg</span> <span class="o">+=</span> <span class="s2">"${libdir}/${PYTHON_DIR}/site-packages/.debug"</span></pre></code></pre>
    <pre><code><pre><span class="nv"></span></pre></code></pre>
    <code>
      <pre><span class="nv"></span></pre>
    </code>
    <p>That causes an issue with PyQt5 which is installed in
      (python-pyqt5.inc, meta-qt5 @ f4531ec8):</p>
    <p><tt>echo "py_pylib_dir =
        %(sysroot)/${libdir}/python${PYTHON_BASEVERSION}${PYTHON_ABI}"
        &gt;&gt; pyqt.cfg</tt></p>
    <p>PYTHON_BASEVERSION = "3.7"<br>
      PYTHON_ABI = "m"<br>
    </p>
    <p>This can obviously be fixed on either end, but I am not quite
      sure what the right approach is. <br>
    </p>
    <p>Thanks,</p>
    <p>Rudi<br>
    </p>
    <br>
    <pre class="moz-signature" cols="72"> -----
Rudolf J Streif
CEO/CTO ibeeto
+1.855.442.3396 x700</pre>
  </body>
</html>

--------------A30639AF236F4CCD4C791AD9--
