Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1RSnEo-0001eG-LG
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 11:06:03 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAM9xUqu026222
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 01:59:30 -0800 (PST)
Received: from [128.224.162.225] (128.224.162.225) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 22 Nov 2011 01:59:30 -0800
Message-ID: <4ECB7281.1030900@windriver.com>
Date: Tue, 22 Nov 2011 17:59:29 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: oe-core <openembedded-core@lists.openembedded.org>
X-Originating-IP: [128.224.162.225]
Subject: Design document for Posix test
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Nov 2011 10:06:04 -0000
X-Groupsio-MsgNum: 12700
Content-Type: multipart/mixed; boundary="------------010006010106040405000003"

--------------010006010106040405000003
Content-Type: multipart/alternative;
	boundary="------------040700090606020309000507"

--------------040700090606020309000507
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

The attachment files are the POSIX test result for Yocto 1.1 on non-x86 
platform. And the POSIX test suit is from ltp-full-20110915.
According to POSIX tests for Yocto 1.1 milestones, group

SIG SEM THR TMR MSG TPS MEM

are tested, and AIO is excluded.

There are 1794 test cases in total. Most of them can pass, and others 
have some problems.

1 There are 21 failed items need to be fixed(some occur on different 
platform), they are:

THR(8):

pthread_cond_broadcast/1-2

pthread_create/1-6

pthread_create/10-1

pthread_create/14-1

pthread_mutex_lock/3-1

pthread_rwlock_rdlock/2-1

pthread_rwlock_rdlock/2-1

pthread_rwlock_unlock/3-1

TMR(2):

timer_getoverrun/2-3

clock_getcpuclockid/5-1

MSG(3):

mq_timedreceive/5-2

mq_timedreceive/10-2

mq_timedsend/5-1

TPS(3):

sched_getparam/6-1

sched_getscheduler/7-1

sched_yield/1-1

MEM(5):

mmap/11-4

mmap/11-5

mmap/28-1

mmap/31-1

shm_open/23-1


2 Items need more research

  *

    2.1 sem_init/7-1

  *

    3.1 pthread_cond_broadcast/1-2

  *

    3.4 pthread_create/1-6

  *

    3.1 pthread_cond_broadcast/1-2

There are some items about

  *

    SCHED_SPORADIC

this needs more research too.


Any suggestion is welcome!

Regards,
Kai


--------------040700090606020309000507
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Hi all,<br>
    <br>
    The attachment files are the POSIX test result for Yocto 1.1 on
    non-x86 platform. And the POSIX test suit is from ltp-full-20110915.<br>
    According to POSIX tests for Yocto 1.1 milestones,
    <meta http-equiv="CONTENT-TYPE" content="text/html;
      charset=ISO-8859-1">
    <title></title>
    <meta name="GENERATOR" content="LibreOffice 3.4 (Unix)">
    group
    <style type="text/css">
	<!--
		@page { margin: 2cm }
		P { margin-bottom: 0.21cm }
	-->
	</style>
    <p style="margin-bottom: 0cm; line-height: 150%;"><font
        face="Liberation Serif, serif"><span style="text-decoration:
          none;"><font face="DejaVu Sans, sans-serif"><font
              style="font-size: 13pt;" size="3"><span style="font-style:
                normal;"><span style="font-weight: normal;"><span
                    style="text-decoration: none;">SIG
                    SEM THR TMR MSG TPS MEM<br>
                  </span></span></span></font></font></span></font></p>
    <p style="margin-bottom: 0cm; line-height: 150%;"><font
        face="Liberation Serif, serif"><span style="text-decoration:
          none;"><font face="DejaVu Sans, sans-serif"><font
              style="font-size: 13pt;" size="3"><span style="font-style:
                normal;"><span style="font-weight: normal;"><span
                    style="text-decoration: none;">are tested, and AIO
                    is excluded.<br>
                  </span></span></span></font></font></span></font></p>
    <p style="margin-bottom: 0cm; line-height: 150%">
      <meta http-equiv="CONTENT-TYPE" content="text/html;
        charset=ISO-8859-1">
      <title></title>
      <meta name="GENERATOR" content="LibreOffice 3.4 (Unix)">
      <style type="text/css">
	<!--
		@page { margin: 2cm }
		P { margin-bottom: 0.21cm }
	-->
	</style>
      <p style="margin-bottom: 0cm; font-style: normal; font-weight:
        normal; line-height: 150%; text-decoration: none">
        <font color="#3c3c3c"><font face="DejaVu Sans, sans-serif"><font
              style="font-size: 13pt" size="3"><span
                style="text-decoration: none">There
                are 1794 test cases in total. Most of them can pass, and
                others have
                some problems.</span></font></font></font></p>
      <p style="margin-bottom: 0cm; font-style: normal; font-weight:
        normal; line-height: 150%; text-decoration: none">
        <font color="#3c3c3c"><font face="DejaVu Sans, sans-serif"><font
              style="font-size: 13pt" size="3"><span
                style="text-decoration: none">1
                There are 21 failed items need to be fixed(some occur on
                different
                platform), they are:</span></font></font></font></p>
      <p style="margin-bottom: 0cm; font-style: normal; font-weight:
        normal; line-height: 150%; text-decoration: none">
        <font color="#3c3c3c"><font face="DejaVu Sans, sans-serif"><font
              style="font-size: 13pt" size="3"><span
                style="text-decoration: none">THR(8):
              </span></font></font></font>
      </p>
      <p style="margin-bottom: 0cm; font-style: normal; font-weight:
        normal; line-height: 150%; text-decoration: none">
        <font face="DejaVu Sans, sans-serif"><font size="3"><span
              style="text-decoration: none">pthread_cond_broadcast/1-2
            </span></font></font>
      </p>
      <p style="margin-bottom: 0cm; font-style: normal; font-weight:
        normal; line-height: 150%; text-decoration: none">
        <font face="DejaVu Sans, sans-serif"><font size="3"><span
              style="text-decoration: none">pthread_create/1-6</span></font></font></p>
      <p style="margin-bottom: 0cm; font-style: normal; font-weight:
        normal; line-height: 150%; text-decoration: none">
        <font face="DejaVu Sans, sans-serif"><font size="3"><span
              style="text-decoration: none">pthread_create/10-1</span></font></font></p>
      <p style="margin-bottom: 0cm; font-style: normal; font-weight:
        normal; line-height: 150%; text-decoration: none">
        <font face="DejaVu Sans, sans-serif"><font size="3"><span
              style="text-decoration: none">pthread_create/14-1</span></font></font></p>
      <p style="margin-bottom: 0cm; font-style: normal; font-weight:
        normal; line-height: 150%; text-decoration: none">
        <font face="DejaVu Sans, sans-serif"><font size="3"><span
              style="text-decoration: none">pthread_mutex_lock/3-1</span></font></font></p>
      <p style="margin-bottom: 0cm; font-style: normal; font-weight:
        normal; line-height: 150%; text-decoration: none">
        <font face="DejaVu Sans, sans-serif"><font size="3"><span
              style="text-decoration: none">pthread_rwlock_rdlock/2-1</span></font></font></p>
      <p style="margin-bottom: 0cm; font-style: normal; font-weight:
        normal; line-height: 150%; text-decoration: none">
        <font face="DejaVu Sans, sans-serif"><font size="3"><span
              style="text-decoration: none">pthread_rwlock_rdlock/2-1</span></font></font></p>
      <p style="margin-bottom: 0cm; font-style: normal; font-weight:
        normal; line-height: 150%; text-decoration: none">
        <font face="DejaVu Sans, sans-serif"><font size="3"><span
              style="text-decoration: none">pthread_rwlock_unlock/3-1</span></font></font></p>
      <p style="margin-bottom: 0cm; font-style: normal; font-weight:
        normal; line-height: 150%; text-decoration: none">
        <font color="#3c3c3c"><font face="DejaVu Sans, sans-serif"><font
              style="font-size: 13pt" size="3"><span
                style="text-decoration: none">TMR(2):</span></font></font></font></p>
      <p style="margin-bottom: 0cm; font-style: normal; font-weight:
        normal; line-height: 150%; text-decoration: none">
        <font color="#3c3c3c"><font face="DejaVu Sans, sans-serif"><font
              size="3"><span style="text-decoration: none">timer_getoverrun/2-3</span></font></font></font></p>
      <p style="margin-bottom: 0cm; font-style: normal; font-weight:
        normal; line-height: 150%; text-decoration: none">
        <font color="#3c3c3c"><font face="DejaVu Sans, sans-serif"><font
              size="3"><span style="text-decoration: none">clock_getcpuclockid/5-1</span></font></font></font></p>
      <p style="margin-bottom: 0cm; font-style: normal; font-weight:
        normal; line-height: 150%; text-decoration: none">
        <font color="#3c3c3c"><font face="DejaVu Sans, sans-serif"><font
              style="font-size: 13pt" size="3"><span
                style="text-decoration: none">MSG(3):</span></font></font></font></p>
      <p style="margin-bottom: 0cm; font-style: normal; font-weight:
        normal; line-height: 150%; text-decoration: none">
        <font color="#3c3c3c"><font face="DejaVu Sans, sans-serif"><font
              size="3"><span style="text-decoration: none">mq_timedreceive/5-2</span></font></font></font></p>
      <p style="margin-bottom: 0cm; font-style: normal; font-weight:
        normal; line-height: 150%; text-decoration: none">
        <font color="#3c3c3c"><font face="DejaVu Sans, sans-serif"><font
              size="3"><span style="text-decoration: none">mq_timedreceive/10-2</span></font></font></font></p>
      <p style="margin-bottom: 0cm; font-style: normal; font-weight:
        normal; line-height: 150%; text-decoration: none">
        <font color="#3c3c3c"><font face="DejaVu Sans, sans-serif"><font
              size="3"><span style="text-decoration: none">mq_timedsend/5-1</span></font></font></font></p>
      <p style="margin-bottom: 0cm; font-style: normal; font-weight:
        normal; line-height: 150%; text-decoration: none">
        <font color="#3c3c3c"><font face="DejaVu Sans, sans-serif"><font
              style="font-size: 13pt" size="3"><span
                style="text-decoration: none">TPS(3):</span></font></font></font></p>
      <p style="margin-bottom: 0cm; font-style: normal; font-weight:
        normal; line-height: 150%; text-decoration: none">
        <font color="#3c3c3c"><font face="DejaVu Sans, sans-serif"><font
              size="3"><span style="text-decoration: none">sched_getparam/6-1</span></font></font></font></p>
      <p style="margin-bottom: 0cm; font-style: normal; font-weight:
        normal; line-height: 150%; text-decoration: none">
        <font color="#3c3c3c"><font face="DejaVu Sans, sans-serif"><font
              size="3"><span style="text-decoration: none">sched_getscheduler/7-1</span></font></font></font></p>
      <p style="margin-bottom: 0cm; font-style: normal; font-weight:
        normal; line-height: 150%; text-decoration: none">
        <font color="#3c3c3c"><font face="DejaVu Sans, sans-serif"><font
              size="3"><span style="text-decoration: none">sched_yield/1-1</span></font></font></font></p>
      <p style="margin-bottom: 0cm; font-style: normal; font-weight:
        normal; line-height: 150%; text-decoration: none">
        <font color="#3c3c3c"><font face="DejaVu Sans, sans-serif"><font
              style="font-size: 13pt" size="3"><span
                style="text-decoration: none">MEM(5):</span></font></font></font></p>
      <p style="margin-bottom: 0cm; font-style: normal; font-weight:
        normal; line-height: 150%; text-decoration: none">
        <font color="#3c3c3c"><font face="DejaVu Sans, sans-serif"><font
              size="3"><span style="text-decoration: none">mmap/11-4</span></font></font></font></p>
      <p style="margin-bottom: 0cm; font-style: normal; font-weight:
        normal; line-height: 150%; text-decoration: none">
        <font color="#3c3c3c"><font face="DejaVu Sans, sans-serif"><font
              size="3"><span style="text-decoration: none">mmap/11-5</span></font></font></font></p>
      <p style="margin-bottom: 0cm; font-style: normal; font-weight:
        normal; line-height: 150%; text-decoration: none">
        <font color="#3c3c3c"><font face="DejaVu Sans, sans-serif"><font
              size="3"><span style="text-decoration: none">mmap/28-1</span></font></font></font></p>
      <p style="margin-bottom: 0cm; font-style: normal; font-weight:
        normal; line-height: 150%; text-decoration: none">
        <font color="#3c3c3c"><font face="DejaVu Sans, sans-serif"><font
              size="3"><span style="text-decoration: none">mmap/31-1</span></font></font></font></p>
      <p style="margin-bottom: 0cm; font-style: normal; font-weight:
        normal; line-height: 150%; text-decoration: none">
        <font color="#3c3c3c"><font face="DejaVu Sans, sans-serif"><font
              size="3"><span style="text-decoration: none">shm_open/23-1</span></font></font></font></p>
      <p style="margin-bottom: 0cm; font-style: normal; font-weight:
        normal; line-height: 150%; text-decoration: none">
        <br>
      </p>
      <p style="margin-bottom: 0cm; font-style: normal; font-weight:
        normal; line-height: 150%; text-decoration: none">
        <font color="#3c3c3c"><font face="DejaVu Sans, sans-serif"><font
              style="font-size: 13pt" size="3"><span
                style="text-decoration: none">2
                Items need more research</span></font></font></font></p>
      <ul>
        <li>
          <p style="margin-bottom: 0cm; font-style: normal; font-weight:
            normal; line-height: 150%; text-decoration: none"> <font
              color="#3c3c3c"><font face="DejaVu Sans, sans-serif"><font
                  style="font-size: 13pt" size="3"><span
                    style="text-decoration: none">2.1 sem_init/7-1 </span></font></font></font>
          </p>
        </li>
        <li>
          <p style="margin-bottom: 0cm; font-style: normal; font-weight:
            normal; line-height: 150%; text-decoration: none"> <font
              color="#3c3c3c"><font face="DejaVu Sans, sans-serif"><font
                  style="font-size: 13pt" size="3"><span
                    style="text-decoration: none">3.1
                    pthread_cond_broadcast/1-2 </span></font></font></font>
          </p>
        </li>
        <li>
          <p style="margin-bottom: 0cm; font-style: normal; font-weight:
            normal; line-height: 150%; text-decoration: none"> <font
              color="#3c3c3c"><font face="DejaVu Sans, sans-serif"><font
                  style="font-size: 13pt" size="3"><span
                    style="text-decoration: none">3.4 pthread_create/1-6</span></font></font></font></p>
        </li>
        <li>
          <p style="margin-bottom: 0cm; font-style: normal; font-weight:
            normal; line-height: 150%; text-decoration: none"> <font
              color="#3c3c3c"><font face="DejaVu Sans, sans-serif"><font
                  style="font-size: 13pt" size="3"><span
                    style="text-decoration: none">3.1
                    pthread_cond_broadcast/1-2 </span></font></font></font>
          </p>
        </li>
      </ul>
      <p style="margin-bottom: 0cm; font-style: normal; font-weight:
        normal; line-height: 150%; text-decoration: none">
        <font color="#3c3c3c"><font face="DejaVu Sans, sans-serif"><font
              style="font-size: 13pt" size="3"><span
                style="text-decoration: none">There
                are some items about</span></font></font></font></p>
      <ul>
        <li>
          <p style="margin-bottom: 0cm; font-style: normal; font-weight:
            normal; line-height: 150%; text-decoration: none"> <font
              color="#3c3c3c"><font face="DejaVu Sans, sans-serif"><font
                  style="font-size: 13pt" size="3"><span
                    style="text-decoration: none">SCHED_SPORADIC</span></font></font></font></p>
        </li>
      </ul>
      <p style="margin-bottom: 0cm; font-style: normal; font-weight:
        normal; line-height: 150%; text-decoration: none;">
        <font color="#3c3c3c"><font face="DejaVu Sans, sans-serif"><font
              style="font-size: 13pt;" size="3"><span
                style="text-decoration: none;">this
                needs more research too.<br>
              </span></font></font></font></p>
      <p style="margin-bottom: 0cm; font-style: normal; font-weight:
        normal; line-height: 150%; text-decoration: none;"><font
          color="#3c3c3c"><font face="DejaVu Sans, sans-serif"><font
              style="font-size: 13pt;" size="3"><span
                style="text-decoration: none;"><br>
                Any suggestion is welcome!<br>
              </span></font></font></font></p>
      <p style="margin-bottom: 0cm; font-style: normal; font-weight:
        normal; line-height: 150%; text-decoration: none"><font
          color="#3c3c3c"><font face="DejaVu Sans, sans-serif"><font
              style="font-size: 13pt" size="3"><span
                style="text-decoration: none">Regards,<br>
                Kai<br>
              </span></font></font></font></p>
    </p>
  </body>
</html>

--------------040700090606020309000507--

--------------010006010106040405000003
Content-Type: application/vnd.oasis.opendocument.text;
	name="POSIX-results_and_analysis.odt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="POSIX-results_and_analysis.odt"

UEsDBBQAAAgAAFFNdj9exjIMJwAAACcAAAAIAAAAbWltZXR5cGVhcHBsaWNhdGlvbi92bmQub2Fz
aXMub3BlbmRvY3VtZW50LnRleHRQSwMEFAAACAAAUU12P78phjsTBAAAEwQAAAgAAABtZXRhLnht
bDw/eG1sIHZlcnNpb249IjEuMCIgZW5jb2Rpbmc9IlVURi04Ij8+CjxvZmZpY2U6ZG9jdW1lbnQt
bWV0YSB4bWxuczpvZmZpY2U9InVybjpvYXNpczpuYW1lczp0YzpvcGVuZG9jdW1lbnQ6eG1sbnM6
b2ZmaWNlOjEuMCIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHht
bG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIgeG1sbnM6bWV0YT0idXJu
Om9hc2lzOm5hbWVzOnRjOm9wZW5kb2N1bWVudDp4bWxuczptZXRhOjEuMCIgeG1sbnM6b29vPSJo
dHRwOi8vb3Blbm9mZmljZS5vcmcvMjAwNC9vZmZpY2UiIHhtbG5zOmdyZGRsPSJodHRwOi8vd3d3
LnczLm9yZy8yMDAzL2cvZGF0YS12aWV3IyIgb2ZmaWNlOnZlcnNpb249IjEuMiI+PG9mZmljZTpt
ZXRhPjxtZXRhOmluaXRpYWwtY3JlYXRvcj5uZWlsIDwvbWV0YTppbml0aWFsLWNyZWF0b3I+PG1l
dGE6Y3JlYXRpb24tZGF0ZT4yMDExLTExLTAxVDE3OjA4OjUzPC9tZXRhOmNyZWF0aW9uLWRhdGU+
PGRjOmRhdGU+MjAxMS0xMS0yMlQxNzo0MjozNTwvZGM6ZGF0ZT48ZGM6Y3JlYXRvcj5uZWlsIDwv
ZGM6Y3JlYXRvcj48bWV0YTplZGl0aW5nLWR1cmF0aW9uPlA2RFQyMkg5TTdTPC9tZXRhOmVkaXRp
bmctZHVyYXRpb24+PG1ldGE6ZWRpdGluZy1jeWNsZXM+MTI2PC9tZXRhOmVkaXRpbmctY3ljbGVz
PjxtZXRhOmdlbmVyYXRvcj5MaWJyZU9mZmljZS8zLjQkVW5peCBMaWJyZU9mZmljZV9wcm9qZWN0
LzM0MG0xJEJ1aWxkLTMwMjwvbWV0YTpnZW5lcmF0b3I+PG1ldGE6ZG9jdW1lbnQtc3RhdGlzdGlj
IG1ldGE6dGFibGUtY291bnQ9IjAiIG1ldGE6aW1hZ2UtY291bnQ9IjAiIG1ldGE6b2JqZWN0LWNv
dW50PSIwIiBtZXRhOnBhZ2UtY291bnQ9IjE1IiBtZXRhOnBhcmFncmFwaC1jb3VudD0iMzQ0IiBt
ZXRhOndvcmQtY291bnQ9IjE1MDUiIG1ldGE6Y2hhcmFjdGVyLWNvdW50PSIxMDcwNSIgbWV0YTpu
b24td2hpdGVzcGFjZS1jaGFyYWN0ZXItY291bnQ9Ijk0MzciLz48L29mZmljZTptZXRhPjwvb2Zm
aWNlOmRvY3VtZW50LW1ldGE+UEsDBBQACAgIAFFNdj8AAAAAAAAAAAAAAAAMAAAAc2V0dGluZ3Mu
eG1svVrfc9o4EH6/vyLj9xRIm4QwCR1DSktLCgOkmeubsBfQRdZ6JDnAf38rG3I5sHvUWPfE4B+7
0mq//b5duP24jsTZCyjNUd55jXd17wxkgCGXizvvcdo7b3of23/c4nzOA2iFGCQRSHOuwRh6RJ/R
61K3stt3XqJkC5nmuiVZBLplghbGIHevtd4+3UqdZVfWgsvnO29pTNyq1Var1bvV+3eoFrXGzc1N
Lb27ezRAOeeLY11lT791hYivjuwL2WJSZxf1+oda9t072y7yTWguvPYuDrvtt2+3DrKPc24gsrE5
2162S7vzyGXrhcPqNWpe3nv/fucHPe8rYFOMvd0ds4npjkC58NrvG9eX9dvaoZnjTQ9gbnJtXzQa
16eZfuKhWebabjSbVyca/wJ8scxfeaN5fdUoZ32yxNUYQko16C6ZXIDe8zBDFMCk1zYqgXI++rKj
cKXhAUMosj5nQh9t/jxi8TmXIawhPAxWfp6l7xBC1Oa4kPfDvaVqo7gNtk3pi/JHWZh+hPlGs7zd
QsQ0m/WbsmY1nwlwApjUshOUp5bHhVi5qN80S2Jla7uDxmCUa/yyflk22D8RoymZ2s+6JSrjtU+o
eQO2wcR0USSR3Ad3VdY7iM+VofswLj0WGFT5a2/US66+rycgIDAQ9hRdKLH0nItvq0zR7W3hyn+A
uPJ4ds0uJIoZ4urfoVk/DEdMsSmjdJ7ELKDXfDMxTO1jpoLqP6KyaVJPDqiFOEsZPzH4GIfMFB7i
CdylB2wG4n6rrxwk+AMzyw7TYCnYF3whHfkZJsa6GMALiD85iFB/T6IZpKRWvbf01C1zjJgTTZFG
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
qgQAAMNCAAAAAA==

--------------010006010106040405000003
Content-Type: application/vnd.oasis.opendocument.spreadsheet;
	name="posix_test_results.ods"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="posix_test_results.ods"

UEsDBBQAAAgAANZGcT+FbDmKLgAAAC4AAAAIAAAAbWltZXR5cGVhcHBsaWNhdGlvbi92bmQub2Fz
aXMub3BlbmRvY3VtZW50LnNwcmVhZHNoZWV0UEsDBBQAAAgAANZGcT9f9XMchQMAAIUDAAAIAAAA
bWV0YS54bWw8P3htbCB2ZXJzaW9uPSIxLjAiIGVuY29kaW5nPSJVVEYtOCI/Pgo8b2ZmaWNlOmRv
Y3VtZW50LW1ldGEgeG1sbnM6b2ZmaWNlPSJ1cm46b2FzaXM6bmFtZXM6dGM6b3BlbmRvY3VtZW50
OnhtbG5zOm9mZmljZToxLjAiIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hs
aW5rIiB4bWxuczpkYz0iaHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iIHhtbG5zOm1l
dGE9InVybjpvYXNpczpuYW1lczp0YzpvcGVuZG9jdW1lbnQ6eG1sbnM6bWV0YToxLjAiIHhtbG5z
Om9vbz0iaHR0cDovL29wZW5vZmZpY2Uub3JnLzIwMDQvb2ZmaWNlIiB4bWxuczpncmRkbD0iaHR0
cDovL3d3dy53My5vcmcvMjAwMy9nL2RhdGEtdmlldyMiIG9mZmljZTp2ZXJzaW9uPSIxLjIiPjxv
ZmZpY2U6bWV0YT48bWV0YTppbml0aWFsLWNyZWF0b3I+bmVpbCA8L21ldGE6aW5pdGlhbC1jcmVh
dG9yPjxtZXRhOmNyZWF0aW9uLWRhdGU+MjAxMS0xMC0yNFQxMzoyNjo0NzwvbWV0YTpjcmVhdGlv
bi1kYXRlPjxtZXRhOmdlbmVyYXRvcj5MaWJyZU9mZmljZS8zLjQkVW5peCBMaWJyZU9mZmljZV9w
cm9qZWN0LzM0MG0xJEJ1aWxkLTMwMjwvbWV0YTpnZW5lcmF0b3I+PGRjOmRhdGU+MjAxMS0xMS0x
N1QxNjo1NDo0NTwvZGM6ZGF0ZT48ZGM6Y3JlYXRvcj5uZWlsIDwvZGM6Y3JlYXRvcj48bWV0YTpl
ZGl0aW5nLWR1cmF0aW9uPlAxNERUM0gyTTQ4UzwvbWV0YTplZGl0aW5nLWR1cmF0aW9uPjxtZXRh
OmVkaXRpbmctY3ljbGVzPjQ2PC9tZXRhOmVkaXRpbmctY3ljbGVzPjxtZXRhOmRvY3VtZW50LXN0
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
Kx7ltsVh2mK4uUWS3SNuxapo3Z7z+tVczR0wXPX7uXFsrHnolPcrnMYtDtMQzy0yt68E1kXsIQdP
8sIn/JRv6Bp2nySu2eJ5QX+0Zc/erovDnCAfX/JMjmeEl/a9UdF+cbvM2yls0SUec6In3IGqnzwp
Iq/ecWhJGcUVobBzUZrqccVhq+FAEMThoz/zaLHqoXmt7b5sH050wFPR4+rGJfGo+QIyfgJGXjTm
eQiUuRSaiA/QD0ju3Vnqi1RG4YNGe/BiebjknsJ07Vt4Ln+SS7ZryXJ4yTzZHZIMnqnVaseTJXee
OZY8FlOKu5a7EIs8p8jswEMk9w1RsQrC6vTyZ2tcNHnJARBLksNuzUMk9y0p6vCHWu5H7ofdmQ/2
mBxJvm3NcyR3HqxGlYHwUWa+KzcWJXkfxPpI2u/tCST3m1iYsdkLyxcr3gSZdp7TGUjuICiQ3EFQ
ILmDoCA0+zPPvSWUo/8HF4mBFWTb4JUAAAAASUVORK5CYIJQSwMEFAAACAAA1kZxPwAAAAAAAAAA
AAAAAB8AAABDb25maWd1cmF0aW9uczIvaW1hZ2VzL0JpdG1hcHMvUEsDBBQAAAgAANZGcT8AAAAA
AAAAAAAAAAAaAAAAQ29uZmlndXJhdGlvbnMyL3BvcHVwbWVudS9QSwMEFAAACAAA1kZxPwAAAAAA
AAAAAAAAABoAAABDb25maWd1cmF0aW9uczIvdG9vbHBhbmVsL1BLAwQUAAAIAADWRnE/AAAAAAAA
AAAAAAAAGgAAAENvbmZpZ3VyYXRpb25zMi9zdGF0dXNiYXIvUEsDBBQAAAgAANZGcT8AAAAAAAAA
AAAAAAAcAAAAQ29uZmlndXJhdGlvbnMyL3Byb2dyZXNzYmFyL1BLAwQUAAAIAADWRnE/AAAAAAAA
AAAAAAAAGAAAAENvbmZpZ3VyYXRpb25zMi90b29sYmFyL1BLAwQUAAAIAADWRnE/AAAAAAAAAAAA
AAAAGAAAAENvbmZpZ3VyYXRpb25zMi9tZW51YmFyL1BLAwQUAAAIAADWRnE/AAAAAAAAAAAAAAAA
GAAAAENvbmZpZ3VyYXRpb25zMi9mbG9hdGVyL1BLAwQUAAgICADWRnE/AAAAAAAAAAAAAAAAJwAA
AENvbmZpZ3VyYXRpb25zMi9hY2NlbGVyYXRvci9jdXJyZW50LnhtbAMAUEsHCAAAAAACAAAAAAAA
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
ABAAEAA2BAAAGTYAAAAA

--------------010006010106040405000003--
